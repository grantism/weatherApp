import 'dart:async';

import 'package:http/http.dart';
import 'package:weather_app/models/weather.dart';

import '../models/api_result.dart';
import 'http_status.dart';

class ApiRequest {
  //TODO: API key should be stored in config.
  static const String apiKey = "3fa7e18b1ea5daaa410b1baac80ab7f2";
  //TODO: allow user input to determine which location to display.
  static const String location = "Summer Hill, AUS";
  static const String _baseUrl =
      "http://api.openweathermap.org/data/2.5/weather?q=" +
          location +
          "&APPID=" +
          apiKey +
          "&units=metric";

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
        //TODO: Handle error display better. Investigate how text is localised in flutter.
        return ApiResult.error("Unable to find weather for chosen location.");
      }
    } catch (error) {
      print(error);
      return ApiResult.error("Unable to retrieve weather.");
    }
  }
}
