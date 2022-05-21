import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/common/app_text.dart';
import '../../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  String? text;
  IconData? icon;
  bool isIcon;

  AppButtons({
    Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(
        child: isIcon
            ? Icon(icon, color: color)
            : AppText(text: text!, color: color),
      ),
    );
  }
}
