import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weathe_app/UI/WeatherScreen.dart';

class Geocode {
  String location;
  var latitude, longitude, context;

  Geocode(location, context) {
    this.location = location;
    this.context = context;

    if (location == '') {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Can't get the Location. Please try again....")));
    } else {
      makeRequest();
    }
  }

  Future<http.Response> makeRequest() async {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Loading....')));

    String url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$location.json?access_token=';

    final api1Call = await http.get(url);
    final response1 = jsonDecode(api1Call.body);

    latitude = response1["features"][0]['center'][1];
    longitude = response1["features"][0]['center'][0];

    String url1 =
        'https://api.darksky.net/forecast//$latitude,$longitude?units=si';

    final api2Call = await http.get(url1);
    final response2 = jsonDecode(api2Call.body);
    print(response2);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WeatherDisplay(
                hourSummary: response2['hourly']['summary'],
                hourPrecipetation: response2['hourly']['data'][0]
                    ['precipProbability'],
                hourTemp: response2['hourly']['data'][0]['temperature'],
                hourHumidity: response2['hourly']['data'][0]['humidity'],
                hourPressure: response2['hourly']['data'][0]['pressure'],
                hourVisibility: response2['hourly']['data'][0]['visibility'],
                weekSummary: response2['daily']['summary'],
                weekPrecipitation: response2['daily']['data'][0]
                    ['precipProbability'],
                weekMaxTemp: response2['daily']['data'][0]['temperatureHigh'],
                weekMinTemp: response2['daily']['data'][0]['temperatureLow'],
                weekHumidity: response2['daily']['data'][0]['humidity'],
                weekPressure: response2['daily']['data'][0]['pressure'],
                weekVisibility: response2['daily']['data'][0]['visibility'],
                location: location,
              )),
    );
  }
}
