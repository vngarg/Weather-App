import 'package:flutter/material.dart';
import 'package:weathe_app/UI/CurrentWaether.dart';
import 'package:weathe_app/UI/WeaklyWeather.dart';

class WeatherButton extends StatelessWidget {
  final String data;
  final String response;
  WeatherButton({Key key , this.data , this.response}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
        child: Text(data),
        onPressed: () {
          if(data == 'Current Weather')
            CurrentWeather(context , response);
          else 
            WeaklyWeather(context , response);
        } 
      ),
    );
  }
}
