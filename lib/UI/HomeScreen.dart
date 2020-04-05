import 'package:flutter/material.dart';
import 'package:weathe_app/UI/WeatherScreen.dart';
import 'package:weathe_app/Widgets/Button.dart';
import 'package:weathe_app/Widgets/TextField.dart';

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
          TextFields('Enter Your Location', location),
          Container(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Buttons(
                data: 'Get Weather',
                location: location.text,
              ),
              Buttons(data: 'Get Map', location: location.text),
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
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherDisplay()),
                    );
                  },
                  child: Icon(Icons.navigate_next),
                ),
              ),
            ],
          ),
          Container(
            height: 16.0,
          )
        ],
      ),
    );
  }
}
