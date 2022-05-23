import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/models/place.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/city.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/time_line_item.dart';

import '../models/city.dart';

class TimeLines extends StatelessWidget {
  final String city;
  const TimeLines({Key? key, required this.city});
  @override
  Widget build(BuildContext context) {
    City city1 = context
        .watch<CityNotifier>()
        .cities
        .firstWhere((element) => element.name == this.city);
    final List<Place> places;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonHeader(title: 'Itinerary Planner'),
            SizedBox(height: 50),
            TimeLineItem(
                startTime: "10:00",
                endTime: '01:00',
                title: city1.places[0].name,
                city: city,
                img: (city1.places[0].images[0])),
            TimeLineItem(
                startTime: "10:00",
                endTime: '01:00',
                title: city1.places[1].name,
                city: city,
                img: (city1.places[1].images[0])),
            TimeLineItem(
                startTime: "10:00",
                endTime: '01:00',
                title: city1.places[2].name,
                city: city,
                img: (city1.places[2].images[0])),
          ],
        ),
      ),
    );
  }
}
