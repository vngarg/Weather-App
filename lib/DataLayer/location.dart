class Location {
  String location;
  double latitude;
  double longitude;

  Location(location){
    print('Location in location.dart is $location');
    this.location = location;
  }

  setLatLng(latitude , longitude){
    print('Latitude in loctaion.dart is $latitude and longitude is $longitude');
    this.latitude = latitude;
    this.longitude = longitude;
    print('INSIDE.............');
  }

  // Location.fromJson(Map json) : location = json['location']; 
}