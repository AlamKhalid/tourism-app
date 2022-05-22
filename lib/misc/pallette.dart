import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xffe07e6e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffca7163), //10%
      100: const Color(0xffb36558), //20%
      200: const Color(0xff9d584d), //30%
      300: const Color(0xff864c42), //40%
      400: const Color(0xff703f37), //50%
      500: const Color(0xff5a322c), //60%
      600: const Color(0xff432621), //70%
      700: const Color(0xff2d1916), //80%
      800: const Color(0xff160d0b), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
