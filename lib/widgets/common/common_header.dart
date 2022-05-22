import 'package:flutter/material.dart';
import 'package:tourism_app/pages/home_page.dart';
import 'package:tourism_app/pages/navpages/main_page.dart';

import '../../misc/colors.dart';
import '../../screens/sign_in/sign_in_screen.dart';
import 'app_large_text.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  final bool back;
  const CommonHeader({Key? key, required this.title, this.back = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (back)
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.white,
              icon: Icon(Icons.arrow_back_ios_new),
            ),
          AppLargeText(text: title, color: Colors.white, size: 36),
        ],
      ),
    );
  }
}
