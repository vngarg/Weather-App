import 'package:flutter/material.dart';
import 'package:weathe_app/Bloc/location_bloc.dart';
import 'package:weathe_app/Bloc/provider_bloc.dart';
import 'package:weathe_app/DataLayer/location.dart';
import 'package:weathe_app/UI/blocscreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
      // 1
      stream: BlocProvider.of<LocationBloc>(context).userStream,
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user == null) 
          return YoYo();

          return null;
        //return RestaurantScreen(location: location);
      },
    );
  }
}
