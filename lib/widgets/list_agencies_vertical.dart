import 'package:flutter/material.dart';
import 'package:tourism_app/models/agency.dart';

import '../misc/colors.dart';
import 'icon_and_text.dart';

class ListAgenciesVertical extends StatelessWidget {
  final List<Agency> agencies = const [
    Agency(
      name: 'Hunza Adventure Tours',
      img:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/8c/7e/c3/passu-glacier.jpg?w=1000&h=800&s=1',
      description:
          'Let us introduce ourselves. We are Hunza Adventure Tours, Pakistan and we are one of the leading adventure companies in Pakistan. We specialise in giving a high quality service to all our clients, either those travelling individually or those in groups. Whatever your requirements we are here to help. We can organize Mountaineering, Treks, Expeditions, Jeep Safaris, Camel and Yak Safaris.',
      rating: 4.5,
    ),
    Agency(
      name: 'Exploria',
      img:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/69/a0/49/a-trip-to-remember.jpg?w=2400&h=1800&s=1',
      description:
          'With more than 5000 travelers’ feedback across the continents, #Exploria is a family of energetic youngsters from Pakistan. With the ultimate vision of promoting unheard and unseen #Pakistan before the international community of nature lovers, we make sure Pakistan is what you came for; with our expert chain of team all across the country. Come See Better Pakistan With Us!',
      rating: 4.5,
    ),
    Agency(
      name: 'Go See North Tours',
      img:
          'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/a9/d6/22.jpg',
      description:
          'We are professional tur operators in Pakistan We are 8 years experienced Company in Pakistan. Join us to explore Pakistan North',
      rating: 3,
    ),
    Agency(
      name: 'Active Tours Pakistan',
      img:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/a9/74/e0/wagah-border-pakistan.jpg?w=800&h=-1&s=1',
      description:
          'Active Tours Pakistan is proud to host cultural, historical tours, trekking tours, hunting tours, fishing tours, bike tours, scientific expeditions, research work, educational tours, helicopter safari, jeep safaris, and desert camel safaris, mountaineering expeditions for the famous Peaks of the Karakorum, the Himalayas, and the Hindukush. Other services include logistics for business and personal travel. Our team has the training and experience needed to serve international expeditions, and we are well aware of what is needed to carry out these voyages.',
      rating: 5,
    ),
  ];
  const ListAgenciesVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 25,
        ),
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: agencies.length,
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
                            image: NetworkImage(agencies[index].img))),
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
                              agencies[index].name,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              agencies[index].description.substring(0, 50),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconandTextWidget(
                                  icon: Icons.access_alarm_rounded,
                                  text: 'Normal',
                                  iconColor: AppColors.headingColor1,
                                ),
                                SizedBox(width: 30),
                                IconandTextWidget(
                                  icon: Icons.star,
                                  text: agencies[index].rating.toString(),
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
