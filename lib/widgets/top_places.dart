import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/models/place.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import 'package:tourism_app/widgets/more_button.dart';
import 'package:tourism_app/widgets/places_list_horizontal.dart';
import 'package:tourism_app/widgets/places_list_new.dart';

class TopPlaces extends StatelessWidget {
  final String city;
  final List<Place> places;
  const TopPlaces({Key? key, required this.city, required this.places})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(
                      text: city, color: AppColors.textColor3, size: 22),
                  AppText(text: 'Top Places', color: AppColors.headingColor1),
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: MoreButton(city: city)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListPlaces(places: places, city: city),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              height: 5,
              width: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  AppColors.headingColor1,
                  AppColors.textColor2,
                ],
              )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
