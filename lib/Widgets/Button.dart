import 'package:flutter/material.dart';
import 'package:weathe_app/Backend/Geocode.dart';
import 'package:weathe_app/DataLayer/location.dart';

Widget Buttons(data, location, context) {
  return Container(
    child: RaisedButton(
      child: Text(data),
      onPressed: () {
        data == 'Get Map'
            ? Geocode(Location.location.text , context , 'For Maps')
            : Geocode(Location.location.text , context , 'For Weather');
      },
    ),
  );
}
