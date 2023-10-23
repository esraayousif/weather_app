import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project_stady/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_flutter_project_stady/models/weather_model.dart';
import 'package:new_flutter_project_stady/services/weather_service.dart';
import 'package:new_flutter_project_stady/views/search_view.dart';

class GetWeatherCubit extends Cubit <WeatherState> {
  GetWeatherCubit():super (WeatherInitialState());
   WeatherModel? weatherModel;


GetWeather({required String Cityname}) async{
  try {
     weatherModel = await WeatherService(Dio())
        .getCurrentWeather(cityName: Cityname);
    emit(WeatherLoadedState(weatherModel: weatherModel!));
  }  catch (e) {
    emit(WeatherFailureState(
      e.toString()
    ));
  }
}

}