import 'package:flutter/material.dart';
import 'package:tourism_app/provider/city.dart';
import 'package:tourism_app/screens/sign_in/sign_in_screen.dart';
import 'package:tourism_app/screens/sign_up/sign_up_screen.dart';
import 'package:tourism_app/screens/splash/splash_screen.dart';
import './pages/detail_pages.dart';
import './pages/navpages/main_page.dart';
import './pages/welcome_page.dart';
import './size_config.dart';
import 'package:provider/provider.dart';

import 'misc/pallette.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CityNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Palette.kToDark),
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(),
        SignUpScreen.routeName: (context) => SignInScreen(),
        WelcomePage.routeName: (context) => SplashScreen(),
      },
      initialRoute: WelcomePage.routeName,
      // home: WelcomePage(),
    );
  }
}
