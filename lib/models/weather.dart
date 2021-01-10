import 'dart:convert';

// https://openweathermap.org/current
class Weather {
  final String locationName;
  final String description;
  final int currentTemp;
  final int minTemp;
  final int maxTemp;

  Weather({this.locationName, this.description, this.currentTemp, this.minTemp, this.maxTemp});

  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  //TODO: See if there is a safer way to parse the JSON.
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        locationName: json["name"],
        description: json["weather"][0]["main"],
        currentTemp: json["main"]["temp"].round(),
        minTemp: json["main"]["temp_min"].round(),
        maxTemp: json["main"]["temp_max"].round(),
      );
}
