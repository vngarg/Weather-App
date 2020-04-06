import 'package:flutter/material.dart';
import 'package:weathe_app/Backend/Geocode.dart';
import 'package:weathe_app/Backend/Maps.dart';

class Buttons extends StatelessWidget {
  final String data;
  final String location;
  Buttons({Key key, this.data, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(data),
        onPressed: () {
          data == 'Get Map'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapsDemo(location: location)),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Geocode(location: location)),
                );
        },
      ),
    );
  }
}
