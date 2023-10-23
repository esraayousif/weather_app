import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project_stady/bloc_cubits/weather_cubit/weather_states.dart';
import 'package:new_flutter_project_stady/services/weather_service.dart';

import '../models/weather_model.dart';


class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit (this.weatherService) : super(WeatherLoading());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
  try {
  weatherModel =  await  weatherService.getCurrentWeather(cityName: cityName);
    emit(WeatherSuccess());
  } on Exception catch (e) {
    emit(WeatherFailure());
  }

  }
}