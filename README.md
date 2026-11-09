# Contrail

A clean, ad-free live flight tracker for iOS and Android, built with Flutter.

- **Live map**: every aircraft around you on a dark map, coloured by altitude, refreshed every 6 seconds.
- **Tap a plane**: route, progress, estimated landing time, live altitude, speed and vertical rate, aircraft and registration.
- **Real flown track**: the actual path from take-off, coloured by altitude, with the remaining great-circle route dashed.
- **Altitude profile** for the whole leg.
- **Follow mode** keeps the map centred on the flight.
- **Search** by flight number (`BA116` or `BAW116`), registration (`G-STBP`), Mode S code or aircraft type (`A388`).
- **Above you**: aircraft overhead, closest first, with distance and direction.
- Emergency squawks (7700/7600/7500) highlighted.

## Data

| What | Source |
|---|---|
| Live positions | [adsb.lol](https://adsb.lol) API (free, open data, ODbL) |
| Flown tracks | adsb.lol traces |
| Origin / destination | adsb.lol route database (crowd-sourced; checked against the aircraft's position before use) |
| Base map | Esri World Dark Gray Canvas (personal use; production needs an Esri account or another provider) |

## Architecture

Follows the `ngoni-flutter` conventions: BLoC (never Cubit) with Freezed events and states, json_serializable DTOs, GetIt + Injectable, Dio repositories returning `Either<ApplicationError, T>`, and ARB localisation.

```text
lib/
  main_{development,staging,production}.dart   bootstrap.dart  providers.dart  injection.dart  app.dart
  core/       configs (colours, type, spacing, motion, environment), services, state/location, utils, views/widgets
  traffic/    live aircraft around the map viewport (TrafficBloc)
  flight/     selected flight: route, flown track, progress (FlightBloc)
  search/     flight number / registration / hex / type search (SearchBloc)
  nearby/     aircraft above the person (NearbyBloc)
```

## Run

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run --release -t lib/main_production.dart
```

## Test

```sh
flutter analyze
flutter test
```
