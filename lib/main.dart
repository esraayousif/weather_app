import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project_stady/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_flutter_project_stady/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_flutter_project_stady/views/home_view.dart';

void main() {
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                      BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition,
                    ),
                  ),
                  home: const HomeView(),
                );
              },
            );
          }
      ),
    );
  }
}





MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition.toLowerCase() == 'sunny') {
    return Colors.orange;
  } else if (condition.toLowerCase().contains('snow')) {
    return Colors.lightBlue;
  } else if (condition.toLowerCase().contains('cloudy') ||
      condition.toLowerCase().contains('overcast') ||
      condition.toLowerCase().contains('mist') ||
      condition.toLowerCase().contains('fog')) {
    return Colors.grey;
  } else if (condition.toLowerCase().contains('rain') ||
      condition.toLowerCase().contains('drizzle')) {
    return Colors.lightBlue;
  } else if (condition.toLowerCase().contains('thunder')) {
    return Colors.yellow;
  } else {
    return Colors.red; // Default color
  }}
