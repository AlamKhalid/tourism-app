import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../misc/colors.dart';
import '../../services/userService.dart';
import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  String? name;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? email = prefs.getString('email');
          await addVisited(email, "place", name);
        },
        child: Container(
          width: isResponsive ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.headingColor1,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: isResponsive
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                if (isResponsive)
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppText(
                          text: 'Mark as Visited', color: Colors.white)),
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
