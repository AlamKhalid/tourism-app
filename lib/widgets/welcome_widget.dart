import 'package:flutter/material.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/pages/landing_page.dart';
import 'package:tourism_app/pages/navpages/main_page.dart';
import 'package:tourism_app/widgets/app_large_text.dart';
import 'package:tourism_app/widgets/app_text.dart';

class WelcomeWidget extends StatelessWidget {
  final String title;
  final String description;
  const WelcomeWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLargeText(text: title, color: AppColors.headingColor1),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 250,
          child: AppText(
            text: description,
            color: AppColors.textColor1,
            size: 16,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainPage())),
            child: Container(
              width: 120,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: AppText(text: 'Skip', color: Colors.white),
                    )),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
