// import 'package:flutter/material.dart';
// import 'package:weathe_app/UI/HomeScreen.dart';

// void main() => runApp(WeatherApp());

// class WeatherApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Weather App',
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue
//       ),
//       home: MyApp()
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weathe_app/Bloc/bloc.dart';
import 'package:weathe_app/Bloc/provider_bloc.dart';
import 'package:weathe_app/UI/MainScreen.dart';

import 'Bloc/location_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc> (
      bloc:LocationBloc(),
      child: MaterialApp(
        title: 'Demo for Bloc Pattern',
        home: MainScreen(),
      ),
    );
  }
}