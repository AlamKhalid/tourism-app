import 'package:flutter/material.dart';
import 'package:tourism_app/models/place.dart';
import 'package:tourism_app/widgets/icon_and_text.dart';

import '../misc/colors.dart';

class ListPlacesVertical extends StatelessWidget {
  final List<Place> places;
  const ListPlacesVertical({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 25,
        ),
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Container(
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
                            image: NetworkImage(places[index].images[0]))),
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
                              places[index].name,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${places[index].description.substring(0, 48)}...",
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
                                  text: '1.7km',
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
        });
  }
}
