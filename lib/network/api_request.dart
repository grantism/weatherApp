import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../models/api_result.dart';


class ApiRequest {
  static const String _baseUrl = "http://api.openweathermap.org/data/2.5/weather?q=Summer%20Hill,%20AUS&APPID=3fa7e18b1ea5daaa410b1baac80ab7f2&units=metric";

  final Client _client = Client();

  Future<Response> request() async {
    return _client.get("$_baseUrl");
  }

  Future<ApiResult> getWeather() async {
    try {
      final response = await this.request();
      if (response.statusCode == 200) {
        print(response.body);
        return ApiResult.success("Yay!");
      } else {
        return ApiResult.error("Unable to find weather for chosen location.");
      }
    } catch (error) {
      return ApiResult.error("Unable to retrieve weather.");
    }
  }
}

