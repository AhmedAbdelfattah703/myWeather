import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_weather/models/weather_model.dart';

class WeatherService{
    final Dio dio;
  final String baseURL  = "https://api.weatherapi.com/v1";
  final String apiKey = "128da4a6e1c240c9b4d162604240112";
  WeatherService({required this.dio});
Future< WeatherModel>  getcurrentWeather({required String cityName})async{

  try {
  Response response =  await dio.get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');
  
  WeatherModel weatherModel= WeatherModel.fromJson(response.data);
  return weatherModel;
}on DioException catch (e) {
  final String errMessage = e.response?.data['error']['message'] ?? 'oops there was an Error , try later';
  throw Exception(errMessage);
} catch (e){
  log(e.toString());
  throw Exception('oops there was an error');
}
}

}