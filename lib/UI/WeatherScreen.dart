import 'package:flutter/material.dart';
import 'package:weathe_app/UI/CurrentWaether.dart';
import 'package:weathe_app/UI/WeaklyWeather.dart';
import 'package:weathe_app/Widgets/WeatherButton.dart';

void main() => runApp(WeatherDisplay());

class WeatherDisplay extends StatelessWidget {
  final String response;
  WeatherDisplay({Key key, this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Weather(response: response),
    );
  }
}

class Weather extends StatelessWidget {
  final String response;
  Weather({Key key, this.response}) : super(key: key);

  @override
  void initState() {
    WeatherButton(data: 'Current Weather');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            WeatherButton(data: 'Current Weather' , response: response),
            WeatherButton(data: 'Weakly Weather' , response: response,)
          ],
        ),
        Expanded(
          child: WeaklyWeather(context , response),
        ),
      ],
    );
  }
}
