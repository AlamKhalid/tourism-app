import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/models/city.dart';

Future<String> login(email, password) async {
  final response = await http.post(
      Uri.parse('https://tourip-backend.herokuapp.com/api/auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'email': email, 'password': password}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var jsonResponse = response.body;
    return jsonResponse;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return 'error';
  }
}

Future<String> register(email, password) async {
  // final response = await http.get(Uri.parse('http://10.0.2.2:4000/api/users'));
  final response = await http.post(
      Uri.parse('https://tourip-backend.herokuapp.com/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'email': email, 'password': password}));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var jsonResponse = response.body;
    return jsonResponse;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return 'error';
  }
}
