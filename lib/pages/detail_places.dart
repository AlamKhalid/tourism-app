import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/services/userService.dart';
import 'package:tourism_app/widgets/common/app_buttons.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import 'package:tourism_app/widgets/common/responsive_button.dart';
import '../misc/colors.dart';
import '../models/place.dart';
import '../widgets/common/app_large_text.dart';

class DetailPlaces extends StatefulWidget {
  const DetailPlaces({Key? key, required this.place, required this.city})
      : super(key: key);
  final Place place;
  final String city;
  @override
  State<DetailPlaces> createState() => _DetailPlacesState();
}

class _DetailPlacesState extends State<DetailPlaces> {
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
                    image: NetworkImage(widget.place.images[0]),
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
                        text: widget.place.name, color: AppColors.textColor1),
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
                              text: '${widget.city}, ',
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
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(text: '(3.0)', color: AppColors.textColor1),
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
                              text: widget.place.description,
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
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? email = prefs.getString('email');
                        await addWishlist(email, "place", widget.place.name);
                      },
                      child: AppButtons(
                        color: AppColors.headingColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.headingColor1,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      name: widget.place.name,
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
