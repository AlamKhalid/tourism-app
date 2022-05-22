import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/provider/city.dart';
import 'package:tourism_app/widgets/common/header.dart';
import 'package:tourism_app/widgets/top_places.dart';
import '../models/city.dart';
import '../widgets/common/app_large_text.dart';
import '../../services/cityService.dart';

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
    var cities = context.watch<CityNotifier>().cities;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: cities.length,
                itemBuilder: ((context, index) => TopPlaces(
                    city: cities[index].name, places: cities[index].places))),
          )
        ],
      ),
    );
  }
}
