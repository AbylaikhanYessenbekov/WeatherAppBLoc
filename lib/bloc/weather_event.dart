
abstract class WeatherEvent {}

class WeatherGetEvent extends WeatherEvent {
  String city;

  WeatherGetEvent({required this.city});
}