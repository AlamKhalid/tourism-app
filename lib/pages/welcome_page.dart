import 'package:flutter/material.dart';
import 'package:tourism_app/pages/home_page.dart';
import 'package:tourism_app/widgets/welcome_widget.dart';
import '../widgets/responsive_button.dart';
import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import './navpages/main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List welcomeList = [
    {
      'img': 'welcome-one.png',
      'title': 'Trip Planner',
      'desc':
          'Organizing your trips and tours efficiently with day wise and hourly wise breakdown.'
    },
    {
      'img': 'welcome-two.jpeg',
      'title': 'Trip Planner',
      'desc':
          'Organizing your trips and tours efficiently with day wise and hourly wise breakdown.'
    },
    {
      'img': 'welcome-three.png',
      'title': 'Trip Planner',
      'desc':
          'Organizing your trips and tours efficiently with day wise and hourly wise breakdown.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: welcomeList.length,
        itemBuilder: (_, index) => Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/${welcomeList[index]['img']}",
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
              top: 150,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WelcomeWidget(
                    title: welcomeList[index]['title'],
                    description: welcomeList[index]['desc']),
                Column(
                  children: List.generate(
                      3,
                      (indexDots) => Container(
                            margin: const EdgeInsets.only(
                              bottom: 2,
                            ),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.textColor1
                                  : AppColors.textColor1.withOpacity(0.3),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
