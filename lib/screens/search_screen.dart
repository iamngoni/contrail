import 'dart:async';

import 'package:flutter/material.dart';

import '../data/adsb_api.dart';
import '../data/airlines.dart';
import '../data/models.dart';
import '../theme.dart';
import '../widgets/common.dart';
import '../widgets/plane_icon.dart';

/// Find a flight by flight number (BA116 or BAW116), registration (G-STBP),
/// Mode S hex code or aircraft type (A388).
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.api, required this.around});

  final AdsbApi api;
  final List<Aircraft> around;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _ctl = TextEditingController();
  Timer? _debounce;
  List<Aircraft> _results = const [];
  bool _loading = false;
  String _searched = '';

  @override
  void dispose() {
    _debounce?.cancel();
    _ctl.dispose();
    super.dispose();
  }

  void _onChanged(String q) {
    _debounce?.cancel();
    final local = _localMatches(q);
    setState(() => _results = local);
    if (q.trim().length >= 3) {
      _debounce = Timer(const Duration(milliseconds: 450), () => _search(q));
    }
  }

  List<Aircraft> _localMatches(String q) {
    final s = q.trim().toUpperCase().replaceAll(' ', '');
    if (s.length < 2) return const [];
    return widget.around
        .where((a) =>
            (a.callsign?.contains(s) ?? false) ||
            (a.callsign != null && flightNumber(a.callsign!).contains(s)) ||
            (a.registration?.replaceAll('-', '').contains(s.replaceAll('-', '')) ?? false))
        .take(20)
        .toList();
  }

  Future<void> _search(String q) async {
    final s = q.trim().toUpperCase().replaceAll(' ', '');
    if (s.isEmpty) return;
    setState(() => _loading = true);
    final found = <String, Aircraft>{for (final a in _localMatches(q)) a.hex: a};
    final futures = <Future<List<Aircraft>>>[
      for (final c in callsignCandidates(s)) widget.api.byCallsign(c),
      widget.api.byRegistration(s.contains('-') ? s : s),
      if (RegExp(r'^[0-9A-F]{6}$').hasMatch(s))
        widget.api.byHex(s.toLowerCase()).then((a) => a == null ? <Aircraft>[] : [a]),
      if (RegExp(r'^[A-Z][A-Z0-9]{2,3}$').hasMatch(s)) widget.api.byType(s),
    ];
    for (final list in await Future.wait(futures)) {
      for (final a in list.take(40)) {
        found[a.hex] = a;
      }
    }
    if (!mounted || _ctl.text.trim().toUpperCase().replaceAll(' ', '') != s) return;
    setState(() {
      _results = found.values.toList();
      _loading = false;
      _searched = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return Scaffold(
      backgroundColor: Palette.bg.withValues(alpha: 0.94),
      body: Padding(
        padding: EdgeInsets.fromLTRB(14, top + 8, 14, 0),
        child: Column(children: [
          Row(children: [
            Expanded(
              child: Glass(
                radius: 14,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _ctl,
                  autofocus: true,
                  onChanged: _onChanged,
                  onSubmitted: _search,
                  textCapitalization: TextCapitalization.characters,
                  autocorrect: false,
                  style: const TextStyle(fontSize: 15),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search_rounded, size: 19, color: Palette.muted),
                    hintText: 'BA116, G-STBP, A388…',
                    hintStyle: TextStyle(color: Palette.muted),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Palette.text)),
            ),
          ]),
          if (_loading) const LinearProgressIndicator(minHeight: 1, color: Palette.muted, backgroundColor: Colors.transparent),
          Expanded(
            child: _results.isEmpty
                ? _empty()
                : ListView.separated(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: _results.length,
                    separatorBuilder: (_, _) => const Hairline(vertical: 0),
                    itemBuilder: (_, i) => _row(_results[i]),
                  ),
          ),
        ]),
      ),
    );
  }

  Widget _empty() {
    final msg = _searched.isNotEmpty && !_loading
        ? 'Nothing airborne matches "$_searched" right now.'
        : 'Search by flight number, registration, Mode S code or aircraft type.';
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(msg, textAlign: TextAlign.center, style: const TextStyle(color: Palette.muted, fontSize: 13.5)),
    );
  }

  Widget _row(Aircraft a) {
    final cs = a.callsign;
    return InkWell(
      onTap: () => Navigator.pop(context, a),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(children: [
          SizedBox(
            width: 34,
            child: PlaneIcon(color: Palette.altitude(a.altitudeFt, onGround: a.onGround), size: 22, headingDeg: a.trackDeg ?? 0),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(cs != null ? flightNumber(cs) : (a.registration ?? a.hex.toUpperCase()), style: mono(14)),
              const SizedBox(height: 2),
              Text(
                [airlineName(cs), a.type, a.registration].whereType<String>().join(' · '),
                style: const TextStyle(fontSize: 12, color: Palette.muted),
              ),
            ]),
          ),
          Text(a.onGround ? 'On ground' : '${a.altitudeFt ?? 0} ft', style: mono(12, color: Palette.muted)),
        ]),
      ),
    );
  }
}
