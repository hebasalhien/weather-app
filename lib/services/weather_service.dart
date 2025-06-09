import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio,});
  final String baseUrl = 'https://api.weatherapi.com/v1';
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          'key': 'd4a5b346a5f94ee1859121654250204',
          'q': cityName,
          'days': 1,
        },
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage =
          e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errormessage);
    } catch (e) {
      throw Exception('oops there was an error , try later ');
    }
  }
}
