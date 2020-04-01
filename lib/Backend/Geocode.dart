import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Get Weather')
        ),
      ),
      body: Geocode(),
    );
  }
}

class Geocode extends StatefulWidget {
  @override
  _GeocodeState createState() => _GeocodeState();
}

class _GeocodeState extends State<Geocode> {
  String url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/meerut.json?access_token=';
  var latitude , longitude , location;

  @override
  void initState() {
    makeRequest();
    super.initState();
  }

  Future<http.Response> makeRequest() async {
    final apiCall = await http.get(url);
    final response = jsonDecode(apiCall.body);

    latitude = response["features"][0]['center'][1];
    longitude = response["features"][0]['center'][0];
    location = response["features"][0]['place_name'];

    String url1='https://api.darksky.net/forecast//$latitude,$longitude?units=si';

    final apiCall1 = await http.get(url1);
    final response1 = jsonDecode(apiCall1.body);
    print(response1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("HELLO WORLD"),
    );
  }
}
