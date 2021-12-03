
import 'package:bloc_app/models/weather.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  Weather weatherJson;
  WeatherLoadedState({required this.weatherJson});
}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {}