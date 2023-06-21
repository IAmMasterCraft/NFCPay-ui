import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryColor = Color(0xFF4E4EB3);
  static const Color secondaryColor = Color(0xFF8358FF);
  static const Color secondaryColor2 = Color(0xFFF258FF);


  static const Color blackColor = Color(0xFF282828);
  static const Color deepGrayColor = Color(0xFF4F4F4F);
  static const Color midGrayColor = Color(0xFF828282);
  static const Color lGrayColor = Color(0xFFBDBDBD);
  static const Color elGrayColor = Color(0xFFE0E0E0);

  static const Color borderColor = Color(0xFFD0E0F2);

  static const Color primaryTextColor = Color(0xFF111111);
  static const Color secondaryTextColor = Color(0xFF3E3F99);

  static const Color white = Colors.white;
  static const Color black = Color(0xff000000);

  //onboard
  static const Color onboardButtonColor = Color(0xffCCCBFF);
  static const Color onboardButtonColor2 = Color(0xffD0C0FF);


  static List<Color> obGradient1 = [
    secondaryColor.withOpacity(0.42),
    secondaryColor2,
  ];

  static List<Color> obGradient2 = [
    const Color(0xFF4648FF).withOpacity(0.27),
    const Color(0xFF0C3FA1),
  ];
}
