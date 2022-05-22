import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import '../../../pages/detail_pages.dart';
import 'package:tourism_app/widgets/timeline.dart';
import '../../../pages/navpages/main_page.dart';
import '/constants.dart';
import '/screens/sign_in/sign_in_screen.dart';
import '/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List splashData = [
    {
      'image': 'assets/images/splash_1.png',
      'title': 'Trip Planner',
      'desc':
          'Organizing your trips and tours efficiently with day wise and hourly wise breakdown.'
    },
    {
      'image': 'assets/images/splash_2.png',
      'title': 'Hotel Finder',
      'desc':
          'Finding the best hotels according to your budget for a comfy and smooth journey.'
    },
    {
      'image': 'assets/images/splash_3.png',
      'title': 'Other Services',
      'desc':
          'Assissting with other complimentary features like finding flights, restaurants etc.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            CommonHeader(title: 'T O U R I P'),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['title'],
                  desc: splashData[index]['desc'],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
