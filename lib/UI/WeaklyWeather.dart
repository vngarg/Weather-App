import 'package:flutter/material.dart';
import 'package:weathe_app/DataLayer/location.dart';

Widget WeaklyWeather(context, weekSummary, weekPrecipitation, weekMaxTemp,
    weekMinTemp, weekHumidity, weekPressure, weekVisibility, location) {
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
            Text('Weakly Weather',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
            Details('Location', '$location'),
            Details('Summary', '$weekSummary'),
            Details('Minnimum Temperature', '$weekMinTemp C'),
            Details('Maximum Temperature', '$weekMaxTemp C'),
            Details('Precipitation Probability', '$weekPrecipitation %'),
            Details('Humidity', '$weekHumidity g/cc'),
            Details('Pressure', '$weekPressure Pa'),
            Details('Visibility', '$weekVisibility m'),
          ],
        ),
      ),
    ),
  ]);
}
