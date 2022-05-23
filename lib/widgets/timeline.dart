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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonHeader(title: 'Itinerary Planner', back: true),
            SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: AppColors.textColor1),
              ),
              child: Text(
                'DAY 1',
                style: TextStyle(fontSize: 25),
              ),
            ),
            TimeLineItem(
                startTime: "10:00 am",
                endTime: '01:00 pm',
                title: city1.places[0].name,
                city: city,
                img: (city1.places[0].images[0])),
            TimeLineItem(
                startTime: "1:00 pm",
                endTime: '3:00 pm',
                title: city1.places[1].name,
                city: city,
                img: (city1.places[1].images[0])),
            TimeLineItem(
                startTime: "3:00 pm",
                endTime: '4:00 pm',
                title: city1.restaurants[2].name,
                city: city,
                img: (city1.restaurants[2].images[0])),
            TimeLineItem(
                startTime: "4:00pm",
                endTime: '7:00pm',
                title: city1.places[2].name,
                city: city,
                img: (city1.places[2].images[0])),
            TimeLineItem(
                startTime: "7:00pm",
                endTime: '10:00pm',
                title: city1.hotels[6].name,
                city: city,
                img: (city1.hotels[6].images[0])),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: AppColors.textColor1),
              ),
              child: Text(
                'DAY 2',
                style: TextStyle(fontSize: 25),
              ),
            ),
            TimeLineItem(
                startTime: "10:00 am",
                endTime: '01:00 pm',
                title: city1.places[0].name,
                city: city,
                img: (city1.places[0].images[0])),
            TimeLineItem(
                startTime: "1:00 pm",
                endTime: '3:00 pm',
                title: city1.places[1].name,
                city: city,
                img: (city1.places[1].images[0])),
            TimeLineItem(
                startTime: "3:00 pm",
                endTime: '4:00 pm',
                title: city1.restaurants[2].name,
                city: city,
                img: (city1.restaurants[2].images[0])),
            TimeLineItem(
                startTime: "7:00pm",
                endTime: '10:00pm',
                title: city1.places[2].name,
                city: city,
                img: (city1.places[2].images[0])),
            TimeLineItem(
                startTime: "4:00pm",
                endTime: '7:00pm',
                title: city1.hotels[6].name,
                city: city,
                img: (city1.hotels[6].images[0])),
          ],
        ),
      ),
    );
  }
}
