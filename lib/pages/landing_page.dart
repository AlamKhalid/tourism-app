import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/common/header.dart';
import 'package:tourism_app/widgets/top_places.dart';
import '../widgets/common/app_large_text.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: topCities.length,
                itemBuilder: ((context, index) =>
                    TopPlaces(city: topCities[index]))),
          ),
        ],
      ),
    );
  }
}
