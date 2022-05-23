import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/common/app_buttons.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import 'package:tourism_app/widgets/common/responsive_button.dart';
import '../misc/colors.dart';
import '../models/hotel.dart';
import '../models/place.dart';
import '../widgets/common/app_large_text.dart';

class DetailHotels extends StatefulWidget {
  const DetailHotels(
      {Key? key,
      required this.name,
      required this.city,
      required this.networkImage,
      required this.description,
      required this.rating})
      : super(key: key);
  final String name;
  final String city;
  final String description;
  final NetworkImage networkImage;
  final String rating;
  @override
  State<DetailHotels> createState() => _DetailHotelsState();
}

class _DetailHotelsState extends State<DetailHotels> {
  int gottenStars = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (widget.networkImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(
                        text: widget.name, color: AppColors.textColor1),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_alarm_outlined,
                          color: AppColors.bigTextColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(text: '2h 30m', color: AppColors.bigTextColor),
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.location_on,
                          color: AppColors.bigTextColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Row(children: [
                          AppText(
                              text: '${widget.city},',
                              color: AppColors.bigTextColor),
                          AppText(
                              text: 'Pakistan', color: AppColors.bigTextColor),
                        ]),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: index < int.parse(widget.rating)
                                  ? AppColors.starColor
                                  : AppColors.textColor5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(
                            text: widget.rating, color: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                                text: 'Description',
                                color: Colors.black.withOpacity(0.8),
                                size: 22),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: widget.description,
                              color: Colors.grey,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.headingColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.headingColor1,
                      size: 60,
                      isIcon: true,
                      icon: Icons.favorite,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
