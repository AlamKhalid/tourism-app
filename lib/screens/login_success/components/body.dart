import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/pages/navpages/main_page.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHeader(title: 'Login Success'),
        SizedBox(height: SizeConfig.screenHeight * 0.11),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go to home",
            press: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainPage()));
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
