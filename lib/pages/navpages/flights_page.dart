import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/flight_widets/flights_button.dart';
import 'package:tourism_app/widgets/common/header.dart';

import '../../misc/colors.dart';
import '../../widgets/common/app_large_text.dart';
import '../../widgets/flight_widets/selectOptions.dart';
import '../../widgets/flight_widets/selectWay.dart';

class FlightsPage extends StatefulWidget {
  @override
  _FlightsPageState createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  String? from, to, adults;
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFf6f5fb),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonHeader(
              title: 'Flights',
            ),
            SizedBox(height: 100),
            SelectWay(),
            SizedBox(height: 25),
            SelectOptions(),
            SizedBox(height: 16),
            FlightsButton(label: 'Search for Flights')
          ],
        ),
      ),
    );
  }
}
