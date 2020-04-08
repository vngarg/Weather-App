import 'dart:async';
import 'package:weathe_app/DataLayer/getCoordinates.dart';
import 'package:weathe_app/DataLayer/location.dart';
import 'bloc.dart';

class LocationBloc implements Bloc {
  final _client = HttpClient();
  Location _location;
  Location get appUser => _location;

  // 1
  final _userController = StreamController<Location>();

  // 2
  Stream<Location> get userStream => _userController.stream;

  // 3
  Future<void> sendLocation(loc) async {
    Location newLocation = new Location(loc.text);
    print('Loctaion in location_bloc.dart after initializing newLocation is ${newLocation.location}');
    try{
      print('ENTER..........');
      final finalLocation = await _client.getCoordinates(newLocation);
      print('EXIT................');
      final weather = _client.getWeather(finalLocation);
      print('Weather in location.dart screen after cal of both functions $weather');
      _location = finalLocation;
      print("YO YO...........");

    }catch(error){
      print("ERROR................");
      print(error);
    }
  }

  // 4
  @override
  void dispose() {
    _userController.close();
  }
}