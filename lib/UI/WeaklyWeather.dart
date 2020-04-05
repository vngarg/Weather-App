import 'package:flutter/material.dart';

Widget WeaklyWeather(context, weekSummary, weekPrecipitation, weekMaxTemp,
    weekMinTemp, weekHumidity, weekPressure, weekVisibility) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Summary:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekSummary',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Minnimum Temperature:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekMinTemp C',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Maximum Temperature:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekMaxTemp C',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Precipitation Probability:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekPrecipitation %',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Humidity:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekHumidity g/cc',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Pressure:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekPressure Pa',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Visibility:    ' , style: TextStyle(fontWeight: FontWeight.bold),),
                FilterChip(
                  label: Text(
                    '$weekVisibility m',
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (null),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  ]);
}
