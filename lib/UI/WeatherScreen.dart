import 'package:flutter/material.dart';

void main() => runApp(WeatherDisplay());

class WeatherDisplay extends StatelessWidget {

  final String response;
  WeatherDisplay ({ Key key , this.response}) : super(key : key);
  
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

class Weather extends StatefulWidget {

  final String response;
  Weather ({ Key key , this.response}) : super(key : key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.response),
    );
  }
}