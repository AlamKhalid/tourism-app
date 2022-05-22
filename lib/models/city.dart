import 'package:tourism_app/models/restaurant.dart';

import 'location.dart';
import 'place.dart';
import 'hotel.dart';

class City {
  final String name;
  final Location location;
  final List<Place> places;
  final List<Hotel> hotels;
  final List<Restaurant> restaurants;
  const City({
    required this.name,
    required this.location,
    required this.places,
    required this.hotels,
    required this.restaurants,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      location: Location(
          longitude: json['location']['longitude'],
          latitude: json['location']['latitude']),
      places: (json['places'] as List).map((p) => Place.fromJson(p)).toList(),
      hotels: (json['hotels'] as List).map((p) => Hotel.fromJson(p)).toList(),
      restaurants: (json['restaurants'] as List)
          .map((p) => Restaurant.fromJson(p))
          .toList(),
    );
  }
}
