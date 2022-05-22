import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tourism_app/services/cityService.dart';
import '../models/city.dart';

class CityNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  List<City> _cities = [];

  List<City> get cities => _cities;

  CityNotifier() {
    populateCities();
  }

  void populateCities() async {
    _cities = await fetchCities();
    notifyListeners();
  }
}
