import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/models/city.dart';

Future<List<City>> fetchCities() async {
  final response = await http
      .get(Uri.parse('https://tourip-backend.herokuapp.com/api/cities'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var jsonResponse = jsonDecode(response.body);
    return (jsonResponse as List).map((e) => City.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
