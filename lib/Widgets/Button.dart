import 'package:flutter/material.dart';
import 'package:weathe_app/Backend/Geocode.dart';
import 'package:weathe_app/Backend/Maps.dart';
import 'package:weathe_app/DataLayer/location.dart';

Widget Buttons(data, location, context) {
  return Container(
    child: RaisedButton(
      child: Text(data),
      onPressed: () {
        data == 'Get Map'
            ? Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Maps()),
                    )
            : Geocode(Location.location.text, context , 'For Weather');
      },
    ),
  );
}
