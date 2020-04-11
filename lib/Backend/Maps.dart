import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weathe_app/DataLayer/location.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Maps());

class Maps extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: Map(),
    );
  }
}

class Map extends StatefulWidget {

  @override
  void initState() {
    print('YO YO..................... ${Location.latitude}');
    makeRequest();
    print('MAJA AA GAYA..................... ${Location.latitude}');
    // super.initState();
  }

  Future<http.Response> makeRequest() async {
    print('MERI JAAN..................... ${Location.latitude}');
    
    String url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${Location.location}.json?access_token=';

    final api1Call = await http.get(url);
    final response1 = jsonDecode(api1Call.body);

    Location.latitude = response1["features"][0]['center'][1];
    Location.longitude = response1["features"][0]['center'][0];
    print('HELLO WORLD..................... ${Location.latitude}');
  }

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(Location.latitude , Location.longitude),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(28.9845, 77.7064),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}