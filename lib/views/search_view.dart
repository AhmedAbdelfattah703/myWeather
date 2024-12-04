import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/models/weather_model.dart';
import 'package:my_weather/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
               weatherModel = await WeatherService(dio: Dio())
                  .getcurrentWeather(cityName: value);
                  Navigator.pop(context);
                  // log(weatherModel.cityName);
            },
            decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: const Icon(Icons.search),
                hintText: "Enter city Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.green),
                )),
          ),
        ),
      ),
    );
  }
}
WeatherModel? weatherModel;
