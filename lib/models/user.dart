import 'restaurant.dart';
import 'place.dart';
import 'hotel.dart';

class User {
  final List<Place> visitedPlaces;
  final List<Hotel> visitedHotels;
  final List<Restaurant> visitedRestaurants;
  final List<Place> wishlistPlaces;
  final List<Hotel> wishlistHotels;
  final List<Restaurant> wishlistRestaurants;
  const User({
    required this.visitedHotels,
    required this.visitedPlaces,
    required this.visitedRestaurants,
    required this.wishlistHotels,
    required this.wishlistPlaces,
    required this.wishlistRestaurants,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      visitedPlaces: (json['visitedPlaces'] as List)
          .map((p) => Place.fromJson(p))
          .toList(),
      visitedHotels: (json['visitedHotels'] as List)
          .map((p) => Hotel.fromJson(p))
          .toList(),
      visitedRestaurants: (json['visitedRestaurants'] as List)
          .map((p) => Restaurant.fromJson(p))
          .toList(),
      wishlistPlaces: (json['wishlistPlaces'] as List)
          .map((p) => Place.fromJson(p))
          .toList(),
      wishlistHotels: (json['wishlistHotels'] as List)
          .map((p) => Hotel.fromJson(p))
          .toList(),
      wishlistRestaurants: (json['wishlistRestaurants'] as List)
          .map((p) => Restaurant.fromJson(p))
          .toList(),
    );
  }
}
