import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/models/city.dart';
import 'package:tourism_app/pages/detail_pages.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import 'package:tourism_app/widgets/common/header.dart';
import 'package:tourism_app/widgets/list_places_vertical.dart';

import '../provider/city.dart';
import '../widgets/list_hotels_vertical.dart';
import '../widgets/list_restaurants_vertical.dart';
import '../widgets/places_list_horizontal.dart';

class HomePage extends StatefulWidget {
  final String city;
  const HomePage({Key? key, required this.city}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var _searchController = TextEditingController();

  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    var chipNames = ['Places', 'Hotels', 'Restaurants'];
    TabController _tabController = TabController(length: 3, vsync: this);
    City city = context
        .watch<CityNotifier>()
        .cities
        .firstWhere((element) => element.name == widget.city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(heading: widget.city, back: true),
            const SizedBox(
              height: 15,
            ),
            // tabbar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                  labelPadding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  controller: _tabController,
                  unselectedLabelColor: AppColors.textColor1,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.headingColor1,
                        AppColors.textColor6
                      ]),
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.textColor2),
                  tabs: [
                    Tab(
                      height: 30,
                      text: 'Places',
                    ),
                    Tab(
                      height: 30,
                      text: 'Hotels',
                    ),
                    Tab(
                      height: 30,
                      text: 'Restaurants',
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              height: 500,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListPlacesVertical(places: city.places),
                  ListHotelsVertical(
                    hotels: city.hotels,
                  ),
                  ListRestaurantsVertical(
                    restaurants: city.restaurants,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !keyboardIsOpen,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.textColor2,
                AppColors.textColor4,
              ],
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          height: 50.0,
          child: new RawMaterialButton(
            elevation: 0.0,
            child: AppLargeText(
                text: 'I T I N E R A T E    M Y    T R I P',
                size: 16,
                color: Colors.white),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
