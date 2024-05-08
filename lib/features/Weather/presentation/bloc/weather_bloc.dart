import 'package:weather_app/enum.dart';
import 'package:weather_app/features/Weather/data/models/LatLang.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfo.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/features/Weather/data/models/WeatherInfoList.dart';
import 'package:weather_app/features/Weather/data/repositories/get_weather_api.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherApi _getWeatherApi = GetWeatherApi();
  WeatherBloc() : super(const WeatherInitial()) {
    on<WeatherInitialEvent>((event, emit) async {
      emit(WeatherLoading());
      LocationPermission permisson = await Geolocator.requestPermission();
      if (LocationPermission.whileInUse == permisson) {
        LatLong userPosition = await WeatherLocationType.userPosition.position;

        final WeatherInfo? weatherInfo =
            await _getWeatherApi.getWeatherInfo(userPosition);
        emit(WeatherLoaded(weatherInfo: weatherInfo));
      } else if (permisson != LocationPermission.whileInUse) {
        emit(WeatherLoadedError(errorType: LoadedError.noPermission));
        print("no permission");
      } else {
        emit(WeatherLoadedError(errorType: LoadedError.e40));
      }
    });
    on<WeatherGetEvent>(
      (event, emit) async {
        emit(WeatherLoading());
        try {
          final WeatherInfo? weatherInfo = await _getWeatherApi.getWeatherInfo(
              LatLong(lat: event.latLang.lat, long: event.latLang.long));
          emit(WeatherLoaded(weatherInfo: weatherInfo));
        } catch (e) {
          emit(WeatherLoadedError(errorType: LoadedError.e40));
        }
      },
    );
  }
}
