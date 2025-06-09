import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key,});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, State) {
          if (State is InitialWeatherState) {
            return const NoWeather();
          } else if (State is WeatherLoadedState) {
            return  WeatherInfo(weatherModel: State.weatherModel)
            ;
          } else {
            return const Center(
              child: Text('Oops, there was an error , try again later'),
            );
          }
        },
      ),
    );
  }
}
