import 'package:flutter/material.dart';
import 'package:weathe_app/UI/HomeScreen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: MyApp()
    );
  }
}