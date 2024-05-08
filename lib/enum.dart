import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/Weather/data/models/LatLang.dart';

enum LoadedError { noPermission, e40 }

enum Localization { russianLocalizedValues, englishLocalizedValues }

enum WeatherLocationType { userPosition, minsk, moscow, london, newYork }

extension WeatherLocation on WeatherLocationType {
  Future<LatLong> get position async {
    switch (this) {
      case WeatherLocationType.userPosition:
        Position userPosition = await Geolocator.getCurrentPosition();
        return LatLong(
            lat: userPosition.latitude, long: userPosition.longitude);
      case WeatherLocationType.minsk:
        return const LatLong(lat: 53.9, long: 27.5667);
      case WeatherLocationType.moscow:
        return const LatLong(lat: 55.7558, long: 37.6176);
      case WeatherLocationType.london:
        return const LatLong(lat: 51.5072, long: -0.1275);
      case WeatherLocationType.newYork:
        return const LatLong(lat: 40.7128, long: -74.0060);
      default:
        return const LatLong(lat: 0, long: 0);
    }
  }
}
