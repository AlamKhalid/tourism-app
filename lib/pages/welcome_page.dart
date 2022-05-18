import 'package:flutter/material.dart';
import '../widgets/responsive_button.dart';
import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) => Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/${images[index]}",
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
              top: 150,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: 'Trips'),
                    AppText(text: 'Mountain', size: 30),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      child: AppText(
                        text:
                            'Moutains hike give you and incredible sense of freedom along with edurance test',
                        color: AppColors.textColor2,
                        size: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ResponsiveButton(
                      width: 120,
                    ),
                  ],
                ),
                Column(
                  children: List.generate(
                      3,
                      (indexDots) => Container(
                            margin: const EdgeInsets.only(
                              bottom: 2,
                            ),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.3),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
