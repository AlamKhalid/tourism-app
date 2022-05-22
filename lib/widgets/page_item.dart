import 'package:flutter/material.dart';
import 'package:tourism_app/models/place.dart';
import '../misc/colors.dart';
import 'common/app_large_text.dart';
import 'common/app_text.dart';
import 'icon_and_text.dart';

class PageItem extends StatelessWidget {
  Matrix4? matrix;
  int index;
  Place place;
  PageItem(
      {Key? key,
      required this.index,
      required this.matrix,
      required this.place})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(place['data']['image']['photo']['photoSizes'][0]['url']);
    return Transform(
      transform: matrix!,
      child: Stack(children: [
        Container(
            height: 220,
            margin: EdgeInsets.only(left: 0, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFF69c5df),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(place.images[0])),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 10, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 247, 246, 246),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xFFe8e8e8),
              //     blurRadius: 5.0,
              //     offset: Offset(0, 5),
              //   ),
              //   BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
              //   BoxShadow(color: Colors.white, offset: Offset(5, 0))
              // ]
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: place.name),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    color: AppColors.mainColor, size: 15))),
                        SizedBox(width: 7),
                        AppText(text: '4.5'),
                        // SizedBox(width: 10),
                        // AppText(text: '1287'),
                        // SizedBox(width: 10),
                        // AppText(text: 'comments'),
                      ],
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
                          text: '1.7km',
                          iconColor: AppColors.headingColor1,
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
