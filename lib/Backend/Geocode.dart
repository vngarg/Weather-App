import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(VirtualLocation());

class VirtualLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Your Climate')
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
  String url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/NewYork.json?access_token=';


  Future<http.Response> makeRequest() async {
    print('Going....');
    final apiCall = await http.get(url);
    final response = jsonDecode(apiCall.body);

    print('Done');
    print(response);
    print("HELLO WORLD..........");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: makeRequest,
      )
    );
  }
}
