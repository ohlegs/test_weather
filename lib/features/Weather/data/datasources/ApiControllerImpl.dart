import 'package:weather_app/features/Weather/data/datasources/ApiControllerAbsrt.dart';
import 'package:weather_app/features/Weather/data/models/LatLang.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfo.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfoList.dart';

class ApiController implements ApiControllerAbsrt {
  final String _API_KEY = '2d3682217fd33ac84febcc5e7b40307f';
  final String _BASE_URL = "https://api.openweathermap.org/data/2.5/";
  final Dio _dio = Dio();

  @override
  Future<WeatherInfo?> getWeatherByCityName(String cityName) async {}

  @override
  Future<WeatherInfo?> getWeatherInfoByLocation(LatLong positin) async {
    try {
      final response = await _dio.get(
        "${_BASE_URL}weather?lat=${positin.lat}&lon=${positin.long}&appid=${_API_KEY}",
      );
      print(response.data);
      if (response.statusCode == 200) {
        return WeatherInfo.fromMap(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<WeatherInfoList?> getWeatherInfoListByLocation(LatLong positin) async {
    try {
      final response = await _dio.get(
        "${_BASE_URL}forecast?lat=${positin.lat}&lon=${positin.long}&appid=${_API_KEY}",
      );

      if (response.statusCode == 200) {
        return WeatherInfoList.fromMap(response.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
