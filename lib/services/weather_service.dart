import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_flutter_project_stady/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '7bcd892f10b243be8d9155552231509';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {

    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data ['error']['message']??'opps their was an error ,try later';
      throw Exception(errorMessage);
    }catch (e){
      log(e.toString());
      throw Exception('opps their was an error ,try later');
    }




  }
}

