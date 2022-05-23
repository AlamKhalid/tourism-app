import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tourism_app/services/cityService.dart';
import '../models/city.dart';
import '../models/place.dart';

class CityNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  List<City> _cities = [];
  String _cityFound = '';

  List<City> get cities => _cities;

  CityNotifier() {
    populateCities();
  }

  String get cityFound => _cityFound;

  Place searchPlace(String searchText) {
    List<Place> allPlaces = [];
    _cities.forEach((e) => e.places.forEach((element) {
          allPlaces.add(element);
        }));
    Place place = allPlaces.firstWhere((element) =>
        element.name.toLowerCase().contains(searchText.toLowerCase()));
    _cityFound =
        _cities.firstWhere((element) => element.places.contains(place)).name;
    return place;
  }

  void populateCities() async {
    _cities = await fetchCities();
    notifyListeners();
  }
}
