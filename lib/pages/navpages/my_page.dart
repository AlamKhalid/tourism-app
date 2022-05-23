import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/profile_menu.dart';
import 'package:tourism_app/widgets/profile_pic.dart';

import '../../screens/sign_in/sign_in_screen.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: 250,
          child: Stack(
            children: <Widget>[
              CommonHeader(title: 'Profile'),
              Positioned(
                top: 130,
                left: MediaQuery.of(context).size.width / 3,
                child: ProfilePic(),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Wishlist",
                icon: "assets/icons/Heart Icon.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Reviews",
                icon: "assets/icons/Gift Icon.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('email');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
