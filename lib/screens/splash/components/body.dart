import 'package:flutter/material.dart';
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
      'title': 'Trip Planner',
      'desc':
          'Organizing your trips and tours efficiently with day wise and hourly wise breakdown.'
    },
    {
      'image': 'assets/images/splash_3.png',
      'title': 'Trip Planner',
      'desc':
          'Organizing your trips and tours efficiently with day wise and hourly wise breakdown.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
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
              flex: 2,
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
