import 'package:flutter/material.dart';

Widget TextFields(hintText, location) {
  return Container(
    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
    child: TextFormField(
      controller: location,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        suffixIcon: Icon(
          Icons.location_city,
          size: 40.0,
        ),
      ),
      textAlign: TextAlign.center,
    ),
  );
}
