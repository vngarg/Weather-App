import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weathe_app/UI/WeatherScreen.dart';
import 'package:weathe_app/Widgets/Button.dart';
import 'package:weathe_app/Widgets/TextField.dart';
import 'package:http/http.dart' as http;

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
  var latitude, longitude;

  Future<http.Response> makeRequest() async {
    String url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${location.text}.json?access_token=';

    final api1Call = await http.get(url);
    final response1 = jsonDecode(api1Call.body);

    latitude = response1["features"][0]['center'][1];
    longitude = response1["features"][0]['center'][0];
    // location = response1["features"][0]['place_name'];

    String url1 =
        'https://api.darksky.net/forecast//$latitude,$longitude?units=si';

    final api2Call = await http.get(url1);
    final response2 = jsonDecode(api2Call.body);
    print(response2);
  }

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
              RaisedButton(child: Text('Get Weather'), onPressed: makeRequest),
              // Buttons(data: 'Get Map'),
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
                      MaterialPageRoute(builder: (context) => Weather()),
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
