import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/services/userService.dart';
import 'package:tourism_app/widgets/common/app_large_text.dart';
import 'package:tourism_app/widgets/common/common_header.dart';
import 'package:tourism_app/widgets/profile_menu.dart';
import 'package:tourism_app/widgets/profile_pic.dart';
import 'package:tourism_app/widgets/wishlist.dart';

import '../../models/user.dart';
import '../../screens/sign_in/sign_in_screen.dart';
import '../../widgets/visited.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  User? user;

  @override
  void initState() {
    getUser();
  }

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    var u = await fetchUser(email);
    setState(() {
      user = u;
    });
  }

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
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ListWishlistVertical(
                          wishlistPlaces:
                              user != null ? user!.wishlistPlaces : [],
                          wishlistHotels:
                              user != null ? user!.wishlistHotels : [],
                          wishlistRestaurants:
                              user != null ? user!.wishlistRestaurants : [])));
                },
              ),
              ProfileMenu(
                text: "Visited",
                icon: "assets/icons/Gift Icon.svg",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ListVisitedVertical(
                          visitedPlaces:
                              user != null ? user!.visitedPlaces : [],
                          visitedHotels:
                              user != null ? user!.visitedHotels : [],
                          visitedRestaurants:
                              user != null ? user!.visitedRestaurants : [])));
                },
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
