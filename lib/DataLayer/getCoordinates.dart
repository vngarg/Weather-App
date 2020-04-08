import 'dart:convert';

import 'package:weathe_app/DataLayer/location.dart';
import 'package:http/http.dart' as http;

class HttpClient {

  Future<Location> getCoordinates(location) async {
    Location loc = new Location(location.location);
    String url =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/${location.location}.json?access_token=';

    final api1Call = await http.get(url);
    final response1 = jsonDecode(api1Call.body);

    loc.setLatLng( response1["features"][0]['center'][1] , response1["features"][0]['center'][0] );
    return loc;
  }

  Future<Location> getWeather(loc) async {
    String url1 =
          'https://api.darksky.net/forecast//${loc.latitude},${loc.longitude}?units=si';

      final api2Call = await http.get(url1);
      final response2 = jsonDecode(api2Call.body);
      print(response2);
      
      return response2;
  }
}