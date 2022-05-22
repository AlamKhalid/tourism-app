import 'package:tourism_app/models/location.dart';

class Restaurant {
  final String name;
  final String description;
  final Location location;
  final String address;
  final num rating;
  final String phone;
  final List<String> images;

  const Restaurant(
      {required this.name,
      required this.description,
      required this.images,
      required this.location,
      required this.address,
      required this.rating,
      required this.phone});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      description: json['description'],
      images: (json['images'] as List).map((e) => e.toString()).toList(),
      location: Location(
          longitude: json['location']['longitude'],
          latitude: json['location']['latitude']),
      address: json['address'],
      rating: json['rating'],
      phone: json['phone'],
    );
  }
}
