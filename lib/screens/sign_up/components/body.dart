import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/common/header.dart';
import '../../../components/socal_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import '../../sign_in/sign_in_screen.dart';
import '../sign_up_screen.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHeader(title: 'Sign Up'),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  Text(
                    "Register Account",
                    style: headingStyle,
                  ),
                  Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SignUpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Aleady Have an account?',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
