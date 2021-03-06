import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/common/header.dart';
import '../../../components/socal_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import '../../sign_in/components/sign_form.dart';
import '../../sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHeader(title: 'Login'),
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
                    "Welcome Back",
                    style: headingStyle,
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SignForm(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Don\'t Have an account?',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                        ;
                      },
                      child: Text(
                        'Register',
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
