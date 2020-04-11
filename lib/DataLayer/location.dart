import 'package:flutter/material.dart';

class Location {
  static var location;
  static double latitude;
  static double longitude;
}

class Mode {
  static Color color, textColor;
  static bool isSwitched = true;
  static Brightness bright = Brightness.light;

  Brightness getBrightness() {
    if (!isSwitched) {
      bright = Brightness.dark;
    } else {
      bright = Brightness.light;
    }
    return bright;
  }

  Color getColors() {
    if (!isSwitched) {
      color = Colors.grey[800];
    } else {
      color = Colors.blue;
    }
    return color;
  }

  Color getTextColor() {
    if (!isSwitched) {
      textColor = Colors.white;
    } else {
      textColor = Colors.black;
    }
    return textColor;
  }
}
