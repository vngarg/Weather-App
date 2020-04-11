import 'package:flutter/material.dart';

class Location {
  static var location;
  static double latitude;
  static double longitude;
}

class Mode {
  static Color color;
  static bool isSwitched = true;
  static Brightness bright = Brightness.light;

  Brightness getBrightness() {
    if(!isSwitched) {
      bright = Brightness.dark;
    }
    else {
      bright = Brightness.light;
    }
    return bright;
  }
}