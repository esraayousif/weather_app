import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project_stady/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_flutter_project_stady/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_flutter_project_stady/views/search_view.dart';
import 'package:new_flutter_project_stady/widgets/no_weather_body.dart';
import 'package:new_flutter_project_stady/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body:  BlocBuilder <GetWeatherCubit,WeatherState >(
          builder: (context, state) {
            if (state is WeatherInitialState){
              return NoWeatherBody();
            }
            else if (state is WeatherLoadedState){
              return WeatherInfoBody(
                Weather:  state.weatherModel,
              );
            } else {
              return Text('opps there was an error');
            }
          }


      ),
    );
  }
}
