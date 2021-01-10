import 'dart:async';

import 'package:http/http.dart';
import 'package:weather_app/models/weather.dart';

import '../models/api_result.dart';
import 'http_status.dart';

class ApiRequest {
  static const String apiKey = "3fa7e18b1ea5daaa410b1baac80ab7f2";
  //TODO: Location should be user supplied.
  static const String location = "Summer%20Hill,AUS";
  static const String _baseUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + location + "&APPID=" + apiKey + "&units=metric";

  final Client _client = Client();

  Future<Response> request() async {
    return _client.get("$_baseUrl");
  }

  Future<ApiResult> getWeather() async {
    try {
      final response = await this.request();
      if (response.statusCode == HttpStatus.SUCCESS) {
        return ApiResult<Weather>.success(Weather.fromRawJson(response.body));
      } else {
        return ApiResult.error("Unable to find weather for chosen location.");
      }
    } catch (error) {
      print(error);
      return ApiResult.error("Unable to retrieve weather.");
    }
  }
}
