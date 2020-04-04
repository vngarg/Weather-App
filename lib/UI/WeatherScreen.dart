import 'package:flutter/material.dart';
import 'package:weathe_app/UI/CurrentWaether.dart';
import 'package:weathe_app/UI/WeaklyWeather.dart';
import 'package:weathe_app/Widgets/WeatherButton.dart';

void main() => runApp(WeatherDisplay());

class WeatherDisplay extends StatelessWidget {
  final String hourSummary;
  final int hourPrecipetation;
  final double hourTemp,
      hourHumidity,
      hourPressure,
      hourVisibility;
  WeatherDisplay(
      {Key key,
      this.hourSummary,
      this.hourHumidity,
      this.hourPrecipetation,
      this.hourPressure,
      this.hourTemp,
      this.hourVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Weather(
        hourHumidity: hourHumidity,
        hourPrecipetation: hourPrecipetation,
        hourPressure: hourPressure,
        hourSummary: hourSummary,
        hourTemp: hourTemp,
        hourVisibility: hourVisibility,
      ),
    );
  }
}

class Weather extends StatelessWidget {
  final String hourSummary;
  final int hourPrecipetation;
  final double hourTemp,
      hourHumidity,
      hourPressure,
      hourVisibility;
  Weather(
      {Key key,
      this.hourSummary,
      this.hourHumidity,
      this.hourPrecipetation,
      this.hourPressure,
      this.hourTemp,
      this.hourVisibility})
      : super(key: key);

  @override
  void initState() {
    WeatherButton(data: 'Current Weather');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            WeatherButton(
              data: 'Current Weather',
              hourHumidity: hourHumidity,
              hourPrecipetation: hourPrecipetation,
              hourPressure: hourPressure,
              hourSummary: hourSummary,
              hourTemp: hourTemp,
              hourVisibility: hourVisibility,
            ),
            WeatherButton(
              data: 'Weakly Weather',
              hourHumidity: hourHumidity,
              hourPrecipetation: hourPrecipetation,
              hourPressure: hourPressure,
              hourSummary: hourSummary,
              hourTemp: hourTemp,
              hourVisibility: hourVisibility,
            )
          ],
        ),
        Expanded(
          child: CurrentWeather(context, hourSummary,
      hourPrecipetation,
      hourTemp,
      hourHumidity,
      hourPressure,
      hourVisibility),
        ),
      ],
    );
  }
}
