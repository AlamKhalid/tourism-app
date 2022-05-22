import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/time_line_item.dart';

class TimeLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                title: 'Faisal Mosque',
                city: 'Islamabad',
                img: 'assets/images/splash_1.png'),
            TimeLineItem(
                startTime: "10:00",
                endTime: '01:00',
                title: 'Daman e Koh',
                city: 'Islamabad',
                img: 'assets/images/welcome-three.png'),
            TimeLineItem(
                startTime: "10:00",
                endTime: '01:00',
                title: 'Shakar Parian',
                city: 'Islamabad',
                img: 'assets/images/welcome-one.png')
          ],
        ),
      ),
    );
  }
}
