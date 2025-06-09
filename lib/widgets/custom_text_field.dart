import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        label: Text('Search', style: TextStyle(fontSize: 20)),
        hintText: 'Enter a city name',
        hintStyle: TextStyle(fontSize: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1.5),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: Colors.orangeAccent, width: 1.5),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: Colors.orangeAccent, width: 1.5),
        // ),
        suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ),
      style: TextStyle(fontSize: 20),
      onSubmitted: (value) async {
        var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
        getWeatherCubit.getWeather(cityName: value);
        Navigator.of(context).pop();
      },
    );
  }
}

