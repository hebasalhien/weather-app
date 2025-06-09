import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfo({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.status),
            getThemeColor(weatherModel.status)[300]!,
            getThemeColor(weatherModel.status)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        spacing: 26,
        children: [
          Spacer(flex: 3),
          Text(
            weatherModel.cityName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          Text(
            'updated at : ${DateFormat('HH:MM').format(weatherModel.lastUpdate)} ',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 15,
            children: [
              CachedNetworkImage(
                imageUrl:
                    weatherModel.image.contains("https")
                        ? weatherModel.image
                        : 'https:${weatherModel.image}',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              Text(
                weatherModel.temp.round().toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherModel.maxTemp.round()}',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    'minTemp: ${weatherModel.minTemp.round()}',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ],
          ),

          Text(
            weatherModel.status,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
