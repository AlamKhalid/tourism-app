import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/models/hotel.dart';
import 'package:tourism_app/models/restaurant.dart';
import 'package:tourism_app/pages/detail_restaurant.dart';
import 'package:tourism_app/widgets/icon_and_text.dart';

import '../misc/colors.dart';
import '../provider/city.dart';

class ListRestaurantsVertical extends StatelessWidget {
  final List<Restaurant> restaurants;
  final String city;
  const ListRestaurantsVertical(
      {Key? key, required this.restaurants, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 25,
        ),
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailRestaurants(
                        name: restaurants[index].name,
                        networkImage:
                            NetworkImage(restaurants[index].images[0]),
                        description: restaurants[index].description,
                        rating:
                            restaurants[index].rating.toStringAsPrecision(1),
                        city: city,
                      )));
            },
            child: Container(
                margin: EdgeInsets.only(left: 0, right: 20, bottom: 20),
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
                              image:
                                  NetworkImage(restaurants[index].images[0]))),
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
                                restaurants[index].name,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                restaurants[index].description,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconandTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: 'Normal',
                                    iconColor: AppColors.headingColor1,
                                  ),
                                  SizedBox(width: 30),
                                  IconandTextWidget(
                                    icon: Icons.location_on,
                                    text: restaurants[index].rating.toString(),
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
                )),
          );
        });
  }
}
