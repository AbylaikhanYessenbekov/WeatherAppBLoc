import 'dart:async';
import 'package:bloc_app/bloc/weather_state.dart';
import 'package:bloc_app/models/weather.dart';
import 'weather_event.dart';
import 'package:bloc/bloc.dart';

import '../services/services.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherGetEvent) {
      yield WeatherLoadingState();
      try {
        Weather _weatherModel =
        await ApiProvider().request(event.city);
        yield WeatherLoadedState(weatherJson: _weatherModel);
      } catch (e) {

        yield WeatherErrorState();
      }
    }
  }
}