import 'package:flutter/material.dart';
import 'package:weathe_app/UI/CurrentWaether.dart';
import 'package:weathe_app/UI/WeaklyWeather.dart';

void main() => runApp(WeatherDisplay());

class WeatherDisplay extends StatelessWidget {
  final String hourSummary, weekSummary;
  var hourPrecipetation,
      hourTemp,
      hourHumidity,
      hourPressure,
      hourVisibility,
      weekMaxTemp,
      weekMinTemp,
      weekHumidity,
      weekPressure,
      weekVisibility,
      weekPrecipitation;
  WeatherDisplay(
      {Key key,
      this.hourSummary,
      this.hourHumidity,
      this.hourPrecipetation,
      this.hourPressure,
      this.hourTemp,
      this.hourVisibility,
      this.weekHumidity,
      this.weekMaxTemp,
      this.weekMinTemp,
      this.weekPrecipitation,
      this.weekPressure,
      this.weekSummary,
      this.weekVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Current Weather',
              ),
              Tab(
                text: 'Weekly Weather',
              ),
            ],
          ),
          title: Text('Weather'),
        ),
        body: TabBarView(
          children: [
            CurrentWeather(context, hourSummary, hourPrecipetation, hourTemp,
                hourHumidity, hourPressure, hourVisibility),
            WeaklyWeather(context, weekSummary, weekPrecipitation, weekMaxTemp,
                weekMinTemp, weekHumidity, weekPressure, weekVisibility),
          ],
        ),
      ),
    );
  }
}
