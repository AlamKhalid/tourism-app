import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../misc/colors.dart';

class TimeLineItem extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String title;
  final String city;
  final String img;
  const TimeLineItem(
      {Key? key,
      required this.startTime,
      required this.endTime,
      required this.title,
      required this.city,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Color.fromARGB(255, 237, 234, 234),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: TimelineTile(
            indicatorStyle: IndicatorStyle(
              color: AppColors.headingColor1,
              height: 30,
              width: 30,
            ),
            beforeLineStyle: LineStyle(color: AppColors.headingColor1),
            endChild: Container(
              margin: EdgeInsets.only(left: 15, bottom: 20, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        startTime,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(endTime, style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 200,
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor),
                      ),
                      Text(
                        city,
                        style: TextStyle(
                            fontSize: 18, color: AppColors.headingColor1),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
