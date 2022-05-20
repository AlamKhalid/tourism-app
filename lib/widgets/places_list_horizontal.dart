import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/app_buttons.dart';
import 'package:tourism_app/widgets/app_large_text.dart';
import '../pages/detail_pages.dart';

class PlacesListHorizontal extends StatelessWidget {
  const PlacesListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailPage())),
          child: Container(
            width: 250,
            height: 400,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'assets/images/mountain.jpeg',
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/mountain.jpeg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            color: Colors.grey)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppLargeText(
                          text: 'Faisal Mosque',
                          size: 16,
                          color: AppColors.textColor1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
