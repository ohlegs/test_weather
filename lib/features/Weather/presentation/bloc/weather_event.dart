part of 'weather_bloc.dart';

sealed class WeatherEvent {}

class WeatherInitialEvent extends WeatherEvent {}

class WeatherGetEvent extends WeatherEvent {
  final LatLong latLang;
  WeatherGetEvent({required this.latLang});
}

class WeatherGetEventList extends WeatherEvent {
  final LatLong latLang;
  WeatherGetEventList({required this.latLang});
}
