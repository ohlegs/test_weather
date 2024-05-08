part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherInitialList extends WeatherState {
  const WeatherInitialList();
}

class WeatherLoading extends WeatherState {
  WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final WeatherInfo? weatherInfo;
  WeatherLoaded({required this.weatherInfo});
}

class WeatherLoadedList extends WeatherState {
  final WeatherInfoList? weatherInfo;
  WeatherLoadedList({required this.weatherInfo});

  get weatherInfoList => null;
}

class WeatherLoadedError extends WeatherState {
  final LoadedError errorType;
  WeatherLoadedError({required this.errorType});
}
