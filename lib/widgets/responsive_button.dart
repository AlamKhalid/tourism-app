import 'package:flutter/material.dart';
import '../misc/colors.dart';
import './app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (isResponsive)
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppText(text: 'Book trip now', color: Colors.white)),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}
