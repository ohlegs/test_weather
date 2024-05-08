import 'package:weather_app/features/Weather/data/models/LatLang.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfo.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfoList.dart';

abstract interface class ApiControllerAbsrt {
  Future<WeatherInfo?> getWeatherInfoByLocation(LatLong cityName);
  Future<WeatherInfoList?> getWeatherInfoListByLocation(LatLong cityName);
  Future<WeatherInfo?> getWeatherByCityName(String cityName);
}
