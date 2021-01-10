import 'package:flutter/material.dart';
import 'package:weather_app/network/api_request.dart';
import 'package:weather_app/models/api_result.dart';
import 'package:weather_app/models/weather.dart';

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
              child: FutureBuilder(
                  future: _apiResponse.getWeather(),
                  builder: (BuildContext context,
                      AsyncSnapshot<ApiResult> snapshot) {
                    if (snapshot.data is SuccessState) {
                      Weather weather =
                          (snapshot.data as SuccessState).value;
                      return weatherBuilder(weather, context);
                    } else if (snapshot.data is ErrorState) {
                      String errorMessage = (snapshot.data as ErrorState).msg;
                      return Text(errorMessage);
                    } else {
                      return CircularProgressIndicator();
                    }
                  })
          )),
    );
  }
}


weatherBuilder(weather, context) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(weather.locationName, style: TextStyle(fontSize: 32)),
    SizedBox(height: 10),
    Text('Mostly Cloudy', style: TextStyle(fontSize: 20)),
    SizedBox(height: 40),
    Text(weather.currentTemp.toString() + '\u2103', style: TextStyle(fontSize: 48)),
  ]);
}