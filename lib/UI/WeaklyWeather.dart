import 'package:flutter/material.dart';

Widget WeaklyWeather(context, hourSummary,
      hourPrecipetation,
      hourTemp,
      hourHumidity,
      hourPressure,
      hourVisibility) {
  return Stack(children: <Widget>[
    Positioned(
      width: MediaQuery.of(context).size.width - 25,
      height: MediaQuery.of(context).size.height / 2.5,
      left: 12.5,
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 100.0),
            Text('Hello World',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
            Text('Height:'),
            Text('Weight:'),
          ],
        ),
      ),
    ),
  ]);
}
