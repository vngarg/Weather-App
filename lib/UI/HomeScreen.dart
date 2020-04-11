import 'package:flutter/material.dart';
import 'package:weathe_app/DataLayer/location.dart';
import 'package:weathe_app/UI/WeatherScreen.dart';
import 'package:weathe_app/Widgets/Button.dart';
import 'package:weathe_app/Widgets/TextField.dart';
import 'package:weathe_app/Widgets/ThemeButton.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Weather App')),
      ),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFields('Enter Your Location', Location.location),
          Container(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Buttons( 'Get Weather', location.text, context ),
              Buttons( 'Get Map', location.text , context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dark Mode'),
              AppMode(),
            ],
          ),
          Container(
            height: 16.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text('For Map'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
