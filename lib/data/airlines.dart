/// Small built-in airline directory: ICAO code -> (IATA code, name).
/// Used to show airline names and to let people search "BA116" as well as "BAW116".
const Map<String, (String, String)> airlines = {
  'AAL': ('AA', 'American Airlines'),
  'ACA': ('AC', 'Air Canada'),
  'AFR': ('AF', 'Air France'),
  'AIC': ('AI', 'Air India'),
  'ANA': ('NH', 'All Nippon Airways'),
  'ANZ': ('NZ', 'Air New Zealand'),
  'AUA': ('OS', 'Austrian Airlines'),
  'AUR': ('GR', 'Aurigny'),
  'AWZ': ('Z7', 'Airlink'),
  'BAW': ('BA', 'British Airways'),
  'BEL': ('SN', 'Brussels Airlines'),
  'CAL': ('CI', 'China Airlines'),
  'CCA': ('CA', 'Air China'),
  'CES': ('MU', 'China Eastern'),
  'CPA': ('CX', 'Cathay Pacific'),
  'CSN': ('CZ', 'China Southern'),
  'DAL': ('DL', 'Delta Air Lines'),
  'DLH': ('LH', 'Lufthansa'),
  'EIN': ('EI', 'Aer Lingus'),
  'EJU': ('U2', 'easyJet Europe'),
  'ETD': ('EY', 'Etihad Airways'),
  'ETH': ('ET', 'Ethiopian Airlines'),
  'EWG': ('EW', 'Eurowings'),
  'EXS': ('LS', 'Jet2'),
  'EZY': ('U2', 'easyJet'),
  'FDX': ('FX', 'FedEx'),
  'FIN': ('AY', 'Finnair'),
  'IBE': ('IB', 'Iberia'),
  'ICE': ('FI', 'Icelandair'),
  'JAL': ('JL', 'Japan Airlines'),
  'JBU': ('B6', 'JetBlue'),
  'KAL': ('KE', 'Korean Air'),
  'KLM': ('KL', 'KLM'),
  'KQA': ('KQ', 'Kenya Airways'),
  'LOT': ('LO', 'LOT Polish Airlines'),
  'MSR': ('MS', 'EgyptAir'),
  'QFA': ('QF', 'Qantas'),
  'QTR': ('QR', 'Qatar Airways'),
  'RAM': ('AT', 'Royal Air Maroc'),
  'RWD': ('WB', 'RwandAir'),
  'RYR': ('FR', 'Ryanair'),
  'SAA': ('SA', 'South African Airways'),
  'SAS': ('SK', 'SAS'),
  'SIA': ('SQ', 'Singapore Airlines'),
  'SWA': ('WN', 'Southwest Airlines'),
  'SWR': ('LX', 'Swiss'),
  'TAP': ('TP', 'TAP Air Portugal'),
  'THY': ('TK', 'Turkish Airlines'),
  'TOM': ('BY', 'TUI Airways'),
  'UAE': ('EK', 'Emirates'),
  'UAL': ('UA', 'United Airlines'),
  'UPS': ('5X', 'UPS Airlines'),
  'VIR': ('VS', 'Virgin Atlantic'),
  'VLG': ('VY', 'Vueling'),
  'WZZ': ('W6', 'Wizz Air'),
  'FAJ': ('FN', 'Fastjet'),
  'AZW': ('UM', 'Air Zimbabwe'),
  'SFR': ('FA', 'FlySafair'),
  'TAM': ('JJ', 'LATAM Brasil'),
};

/// Airline name for a callsign like "BAW116", or null if unknown.
String? airlineName(String? callsign) {
  if (callsign == null || callsign.length < 3) return null;
  return airlines[callsign.substring(0, 3)]?.$2;
}

/// "BAW116" -> "BA116" for display; falls back to the callsign.
String flightNumber(String callsign) {
  if (callsign.length < 4) return callsign;
  final entry = airlines[callsign.substring(0, 3)];
  final rest = callsign.substring(3);
  if (entry == null || !RegExp(r'^\d').hasMatch(rest)) return callsign;
  return '${entry.$1}$rest';
}

/// Converts what a person types into ICAO callsign candidates.
/// "ba 116" -> ["BA116", "BAW116"].
List<String> callsignCandidates(String query) {
  final q = query.toUpperCase().replaceAll(RegExp(r'\s+'), '');
  final out = <String>{q};
  final m = RegExp(r'^([A-Z0-9]{2})(\d+[A-Z]?)$').firstMatch(q);
  if (m != null) {
    for (final e in airlines.entries) {
      if (e.value.$1 == m.group(1)) out.add('${e.key}${m.group(2)}');
    }
  }
  return out.toList();
}
