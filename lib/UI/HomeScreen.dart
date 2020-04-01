import 'package:flutter/material.dart';
import 'package:weathe_app/Widgets/Button.dart';
import 'package:weathe_app/Widgets/TextField.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Weather App')
        ),
      ),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFields(hintText: 'Enter Your Location'),
          Container(
              height: 16.0,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Buttons(data: 'Get Weather'),
              Buttons(data: 'Get Map'),
            ],
          ),
          Container(
            height: 16.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('For maps')
            ),
          )
        ],
      ),
    );
  }
}