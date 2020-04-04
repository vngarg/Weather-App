import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weathe_app/UI/WeatherScreen.dart';

void main() => runApp(BackendGeocode());

class BackendGeocode extends StatelessWidget {
  final String location;
  BackendGeocode({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Get Weather')),
      ),
      body: Geocode(location: location),
    );
  }
}

class Geocode extends StatefulWidget {
  final String location;
  Geocode({Key key, this.location}) : super(key: key);

  @override
  _GeocodeState createState() => _GeocodeState();
}

class _GeocodeState extends State<Geocode> {
  var latitude, longitude;

  @override
  void initState() {
    makeRequest();
    super.initState();
  }

  Future<http.Response> makeRequest() async {
    String url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${widget.location}.json?access_token=';

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
            hourPrecipetation: response2['hourly']['data'][0]['precipProbability'],
            hourTemp: response2['hourly']['data'][0]['temperature'],
            hourHumidity: response2['hourly']['data'][0]['humidity'],
            hourPressure: response2['hourly']['data'][0]['pressure'],
            hourVisibility: response2['hourly']['data'][0]['visibility'],
            // weekSummary: response2['daily']['summary'],
            // weekPrecipitation: response2['daily']['data'][0]['precipProbability'],
            // weekMaxTemp: response2['daily']['data'][0]['temperatureHigh'],
            // weekMinTemp: response2['daily']['data'][0]['temperatureLow'],
            // week
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
