import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project_stady/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_flutter_project_stady/models/weather_model.dart';
import 'package:new_flutter_project_stady/services/weather_service.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
            var getWeatherCubit =  BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.GetWeather(Cityname: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

