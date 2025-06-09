import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialWeatherState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});
}
