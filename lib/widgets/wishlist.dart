import 'package:flutter/material.dart';
import 'package:tourism_app/models/agency.dart';

import '../misc/colors.dart';
import 'common/common_header.dart';
import 'icon_and_text.dart';
import '../models/place.dart';
import '../models/hotel.dart';

import '../models/restaurant.dart';

class ListWishlistVertical extends StatelessWidget {
  final List<Place> wishlistPlaces;
  final List<Hotel> wishlistHotels;
  final List<Restaurant> wishlistRestaurants;
  const ListWishlistVertical(
      {Key? key,
      required this.wishlistHotels,
      required this.wishlistRestaurants,
      required this.wishlistPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(children: [
        CommonHeader(title: 'Wishlist', back: true),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 25,
                ),
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: wishlistPlaces.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 10, right: 20, bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 247, 246, 246),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        wishlistPlaces[index].images[0]))),
                          ),
                          Expanded(
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                color: Color.fromARGB(255, 247, 246, 246),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      wishlistPlaces[index].name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      wishlistPlaces[index]
                                          .description
                                          .substring(0, 50),
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconandTextWidget(
                                          icon: Icons.access_alarm_rounded,
                                          text: 'Normal',
                                          iconColor: AppColors.headingColor1,
                                        ),
                                        SizedBox(width: 30),
                                        IconandTextWidget(
                                          icon: Icons.star,
                                          text: '4',
                                          iconColor: AppColors.headingColor1,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                }))
      ]),
    );
  }
}
