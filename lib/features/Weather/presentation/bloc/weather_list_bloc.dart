import 'package:weather_app/enum.dart';
import 'package:weather_app/features/Weather/data/models/LatLang.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfoList.dart';
import 'package:weather_app/features/Weather/data/repositories/get_weather_api.dart';
import 'package:weather_app/features/Weather/presentation/bloc/weather_bloc.dart';

class WeatherBlocList extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherApi _getWeatherApi = GetWeatherApi();
  WeatherBlocList() : super(const WeatherInitial()) {
    on<WeatherGetEventList>(
      (event, emit) async {
        emit(WeatherLoading());
        try {
          final WeatherInfoList? weatherInfo =
              await _getWeatherApi.getWeatherInfoList(
                  LatLong(lat: event.latLang.lat, long: event.latLang.long));
          emit(WeatherLoadedList(weatherInfo: weatherInfo));
        } catch (e) {
          emit(WeatherLoadedError(errorType: LoadedError.e40));
        }
      },
    );
  }
}
