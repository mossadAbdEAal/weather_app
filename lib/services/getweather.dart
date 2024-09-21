import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weathermodel.dart';

class Getweather {
  final dio = Dio();
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3b6359ac23fa4b19821115725241103';

  Future<Weathermodel> getcurrentweather(String cityname) async {
    try {
      final response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=0');
      Map<String, dynamic> jsondata = response.data;

      Weathermodel weathermodel = Weathermodel.fromjson(jsondata);
      return weathermodel;
    } on DioException catch (e) {
      final String errormsg = e.response?.data['error']['message'];
      throw Exception(errormsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error , try later');
    }
  }


  Future<List<Weathermodel2>> getforecastdays(String cityname) async {
    try {
      final response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=10');
      Map<String, dynamic> jsondata = response.data;
      List<dynamic> days = jsondata['forecast']['forecastday'];
      List<Weathermodel2> weathermodeldays = [];
      for (var day in days) {
        Weathermodel2 weathermodel2 = Weathermodel2.fromjson(day);
        weathermodeldays.add(weathermodel2);
      }

      return weathermodeldays;
      
    } on DioException catch (e) {
      final String errormsg = e.response?.data['error']['message'];
      throw Exception(errormsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error , try later');
    }
  }
}
