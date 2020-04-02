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
  var latitude , longitude;

  @override
  void initState() {
    makeRequest();
    super.initState();
  }

  Future<http.Response> makeRequest() async {
    String url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/meerut.json?access_token=pk.eyJ1IjoiZ2FyZ3NobG9rIiwiYSI6ImNrMm5iZ2Y2czByMWczbW11eWJiM3NuZTEifQ.kqivrVCSR9qlIRtV9S-3tw';

    final api1Call = await http.get(url);
    final response1 = jsonDecode(api1Call.body);

    latitude = response1["features"][0]['center'][1];
    longitude = response1["features"][0]['center'][0];

    String url1='https://api.darksky.net/forecast/f88dd069269d95c9b6eb5b58f0e0f52e/$latitude,$longitude?units=si';

    final api2Call = await http.get(url1);
    final response2 = jsonDecode(api2Call.body);
    print(response2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("HELLO WORLD"),
    );
  }
}
