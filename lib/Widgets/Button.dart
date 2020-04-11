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
            ? Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                    "Developer is Working on Maps. So can't be accessed now.")))
            : Geocode(Location.location.text, context);
      },
    ),
  );
}
