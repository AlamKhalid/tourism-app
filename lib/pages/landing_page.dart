import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/header.dart';
import 'package:tourism_app/widgets/top_places.dart';
import '../widgets/app_large_text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var _searchController = TextEditingController();
  var topCities = ['Islamabad', 'Lahore', 'Karachi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            const SizedBox(
              height: 20,
            ),
            ...topCities.map((e) => TopPlaces(city: e)).toList()
          ],
        ),
      ),
    );
  }
}
