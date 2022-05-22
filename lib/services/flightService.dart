import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/models/city.dart';
import 'package:tourism_app/models/flight.dart';

Future<List<Flight>> fetchFlights(to, from, adults, date) async {
  final uri = Uri.parse('https://flight-fare-search.p.rapidapi.com/v2/flight/')
      .replace(queryParameters: {
    'from': from,
    'to': to,
    'date': date,
    'adult': adults,
    'type': 'economy',
    'currency': 'PKR'
  });
  final response = await http.get(uri, headers: {
    'X-RapidAPI-Host': 'flight-fare-search.p.rapidapi.com',
    'X-RapidAPI-Key': '5b58ba035fmshf4aa99b9a16c28ep13789ajsncc271b048c00'
  });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var jsonResponse = jsonDecode(response.body)['results'];
    return (jsonResponse as List).map((e) => Flight.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
