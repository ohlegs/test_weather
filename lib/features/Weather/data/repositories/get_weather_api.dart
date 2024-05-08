import 'package:weather_app/features/Weather/data/datasources/ApiControllerImpl.dart';
import 'package:weather_app/features/Weather/data/models/LatLang.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfo.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfoList.dart';

class GetWeatherApi {
  Future<WeatherInfo?> getWeatherInfo(LatLong position) async {
    final ApiController apiController = ApiController();

    return apiController.getWeatherInfoByLocation(position);
  }

  Future<WeatherInfoList?> getWeatherInfoList(LatLong position) async {
    final ApiController apiController = ApiController();

    return apiController.getWeatherInfoListByLocation(position);
  }
}
