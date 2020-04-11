import 'package:flutter/material.dart';
import 'package:weathe_app/DataLayer/location.dart';

Widget CurrentWeather(context, hourSummary, hourPrecipetation, hourTemp,
    hourHumidity, hourPressure, hourVisibility, location) {
  Details(text, filterchipText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$text:    ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        FilterChip(
          label: Text(
            '$filterchipText',
            style: TextStyle(color: Mode().getTextColor()),
          ),
          onSelected: (null),
        ),
      ],
    );
  }

  return Stack(children: <Widget>[
    Positioned(
      width: MediaQuery.of(context).size.width - 25,
      top: MediaQuery.of(context).size.height * 0.09,
      height: MediaQuery.of(context).size.height / 1.6,
      left: 12.5,
      child: Card(
        elevation: 16.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Current Weather',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
            Details('Location', '$location'),
            Details('Summary', '$hourSummary'),
            Details('Temperature', '$hourTemp C'),
            Details('Precipitation Probability', '$hourPrecipetation %'),
            Details('Humidity', '$hourHumidity g/cc'),
            Details('Pressure', '$hourPressure Pa'),
            Details('Visibility', '$hourVisibility m')
          ],
        ),
      ),
    ),
  ]);
}
