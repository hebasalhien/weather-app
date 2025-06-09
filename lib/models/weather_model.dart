class WeatherModel {
  WeatherModel({
    required this.maxTemp,
    required this.minTemp,
    required this.status,
    required this.lastUpdate,
    required this.temp,
    required this.cityName,
    required this.image
  });
  final double maxTemp;
  final double minTemp;
  final String status;
  final DateTime lastUpdate;
  final double temp;
  final String cityName;
  final String image;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      lastUpdate: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      cityName: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon']
    );
  }
  
}
