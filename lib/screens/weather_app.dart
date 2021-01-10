import 'package:flutter/material.dart';
import 'package:weather_app/network/api_request.dart';

class WeatherApp extends StatelessWidget {
  ApiRequest _apiResponse = ApiRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Summer Hill', style: TextStyle(fontSize: 32)),
          SizedBox(height: 10),
          Text('Mostly Cloudy', style: TextStyle(fontSize: 20)),
          SizedBox(height: 40),
          Text('21\u2103', style: TextStyle(fontSize: 48)),
            FutureBuilder(
                future: _apiResponse.getWeather()
            )
        ]),
      )),
    );
  }
}
