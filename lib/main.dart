import 'package:flutter/material.dart';
import 'package:tourism_app/screens/sign_up/sign_up_screen.dart';
import './pages/detail_pages.dart';
import './pages/navpages/main_page.dart';
import './pages/welcome_page.dart';
import './size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFE07E6E),
      ),
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(),
        WelcomePage.routeName: (context) => WelcomePage(),
      },
      initialRoute: WelcomePage.routeName,
      // home: WelcomePage(),
    );
  }
}
