import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/widgets/app_large_text.dart';
import 'package:tourism_app/widgets/profile_menu.dart';
import 'package:tourism_app/widgets/profile_pic.dart';

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
              Container(
                padding: EdgeInsets.only(
                  left: 25,
                  top: 30,
                ),
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.headingColor1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    AppLargeText(
                        text: 'Profile', color: Colors.white, size: 36),
                  ],
                ),
              ),
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
                press: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
