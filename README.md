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

## Run

```sh
flutter pub get
flutter run --release
```

## Test

```sh
flutter analyze
flutter test
```
