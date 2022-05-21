import 'package:flutter/material.dart';

import '../../misc/colors.dart';
import 'app_large_text.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  const CommonHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          AppLargeText(text: title, color: Colors.white, size: 36),
        ],
      ),
    );
  }
}
