import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.status,
                  ),
                ),
                home: HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? day) {
  if (day == null) {
    return Colors.blue;
  }
  switch (day) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber; // Bright sunny

    case 'Partly cloudy':
      return Colors.yellow; // Soft daylight

    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey; // Dull cloudy

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey; // Low visibility

    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.lightBlue; // Light rain

    case 'Moderate rain':
    case 'Heavy rain':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain shower':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
      return Colors.blue; // Strong rain

    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Light snow showers':
      return Colors.cyan; // Cold light snow

    case 'Heavy snow':
    case 'Blizzard':
    case 'Moderate or heavy snow showers':
      return Colors.indigo; // Deep snow

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.deepPurple; // Frozen rain

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepOrange; // Thunderstorms

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal; // Icy weather

    case 'Blowing snow':
      return Colors.blueGrey; // Windy snow

    default:
      return Colors.blue; // Unknown / fallback
  }
}
