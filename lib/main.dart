import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weathe_app/UI/HomeScreen.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(WeatherApp());
} 

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