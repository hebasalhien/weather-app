import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        foregroundColor: Colors.white,
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomTextField(),
        ),
      ),
    );
  }
}
