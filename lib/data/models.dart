import 'package:latlong2/latlong.dart';

/// A single aircraft as reported by the ADS-B network (readsb JSON format).
class Aircraft {
  Aircraft({
    required this.hex,
    required this.position,
    this.callsign,
    this.registration,
    this.type,
    this.altitudeFt,
    this.onGround = false,
    this.groundSpeedKt,
    this.trackDeg,
    this.verticalRateFpm,
    this.squawk,
    this.emergency,
    this.description,
  });

  final String hex;
  final LatLng position;
  final String? callsign;
  final String? registration;
  final String? type;
  final int? altitudeFt;
  final bool onGround;
  final double? groundSpeedKt;
  final double? trackDeg;
  final int? verticalRateFpm;
  final String? squawk;
  final String? emergency;
  final String? description;

  String get label => callsign ?? registration ?? hex.toUpperCase();

  bool get isEmergency =>
      squawk == '7700' || squawk == '7600' || squawk == '7500' ||
      (emergency != null && emergency != 'none');

  String? get emergencyText => switch (squawk) {
        '7700' => 'Squawk 7700 · General emergency',
        '7600' => 'Squawk 7600 · Radio failure',
        '7500' => 'Squawk 7500 · Unlawful interference',
        _ => (emergency != null && emergency != 'none') ? 'Emergency: $emergency' : null,
      };

  static Aircraft? fromJson(Map<String, dynamic> j) {
    final lat = (j['lat'] as num?)?.toDouble();
    final lon = (j['lon'] as num?)?.toDouble();
    if (lat == null || lon == null) return null;
    final altRaw = j['alt_baro'];
    final ground = altRaw == 'ground';
    final cs = (j['flight'] as String?)?.trim();
    return Aircraft(
      hex: (j['hex'] as String).replaceAll('~', ''),
      position: LatLng(lat, lon),
      callsign: (cs == null || cs.isEmpty || cs.contains('@')) ? null : cs,
      registration: (j['r'] as String?)?.trim(),
      type: (j['t'] as String?)?.trim(),
      altitudeFt: ground ? 0 : (altRaw as num?)?.round() ?? (j['alt_geom'] as num?)?.round(),
      onGround: ground,
      groundSpeedKt: (j['gs'] as num?)?.toDouble(),
      trackDeg: ((j['track'] ?? j['true_heading'] ?? j['mag_heading']) as num?)?.toDouble(),
      verticalRateFpm: ((j['baro_rate'] ?? j['geom_rate']) as num?)?.round(),
      squawk: j['squawk'] as String?,
      emergency: j['emergency'] as String?,
      description: (j['desc'] as String?)?.trim(),
    );
  }
}

class Airport {
  const Airport({
    required this.iata,
    required this.icao,
    required this.name,
    required this.city,
    required this.position,
  });

  final String iata;
  final String icao;
  final String name;
  final String city;
  final LatLng position;

  String get code => iata.isNotEmpty ? iata : icao;

  static Airport? fromJson(Map<String, dynamic> j) {
    final lat = (j['lat'] as num?)?.toDouble();
    final lon = (j['lon'] as num?)?.toDouble();
    if (lat == null || lon == null) return null;
    return Airport(
      iata: (j['iata'] as String?) ?? '',
      icao: (j['icao'] as String?) ?? '',
      name: (j['name'] as String?) ?? '',
      city: (j['location'] as String?) ?? '',
      position: LatLng(lat, lon),
    );
  }
}

class FlightRoute {
  const FlightRoute({required this.airports, required this.airlineCode});

  /// Origin, any intermediate stops, destination.
  final List<Airport> airports;
  final String? airlineCode;

  Airport get origin => airports.first;
  Airport get destination => airports.last;
}

class TracePoint {
  const TracePoint({
    required this.time,
    required this.position,
    required this.altitudeFt,
    required this.onGround,
  });

  final DateTime time;
  final LatLng position;
  final int altitudeFt;
  final bool onGround;
}

/// The current flight leg reconstructed from an aircraft's trace.
class FlightTrack {
  const FlightTrack({required this.points, required this.departedAt});

  final List<TracePoint> points;

  /// Time the leg started (take-off, or first point seen airborne).
  final DateTime? departedAt;
}
