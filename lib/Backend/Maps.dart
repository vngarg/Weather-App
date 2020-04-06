import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MapsDemo());

class MapsDemo extends StatefulWidget {
  final String location;
  MapsDemo({Key key, this.location}) : super(key: key);

  final String title = "Maps Demo";

  @override
  _MapsDemoState createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  static double latitude=5.02, longitude=45.02;
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _center = LatLng(latitude, longitude);
  final Set<Marker> _marker = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    // makeRequest();
    _onAddMarkerButtonPressed();
    super.initState();
  }

  // Future<http.Response> makeRequest() async {
  //   String url =
  //       'https://api.mapbox.com/geocoding/v5/mapbox.places/${widget.location}.json?access_token=';

  //   final api1Call = await http.get(url);
  //   final response1 = jsonDecode(api1Call.body);

  //   latitude = response1["features"][0]['center'][1];
  //   longitude = response1["features"][0]['center'][0];
  //   print(latitude);
  //   print(longitude);
  // }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _marker.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: "This is the Title Window",
          snippet: "This is the Snippet",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 11.0),
              mapType: _currentMapType,
              markers: _marker,
              onCameraMove: _onCameraMove,
            ),
          ],
        ),
      ),
    );
  }
}
