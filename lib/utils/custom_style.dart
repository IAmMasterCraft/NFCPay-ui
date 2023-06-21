import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  static var bgDecoration2 =const BoxDecoration(
      color: CustomColor.white,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4648FF),
            Color(0xff0C3FA1),
          ],
          
          ),);

  static var bgDecoration1 =  BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
       const Color(0xff8358FF).withOpacity(0.5),
       const Color(0xff8358FF),
       const Color(0xffF258FF),
      ]));

  static Decoration listTileStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
      gradient: LinearGradient(
        colors: [
          CustomColor.white.withOpacity(0.1),
          CustomColor.white.withOpacity(0.03),
        ],
      ));
  static Decoration listTileStyleHome = BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
      gradient: LinearGradient(
        colors: [
          CustomColor.white.withOpacity(0.3),
          CustomColor.white.withOpacity(0.09),
        ],
      ));

  // Common
  static var commonTextTitle = GoogleFonts.inter(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );

  static var hintTitle = GoogleFonts.inter(
    color: Colors.black.withOpacity(0.4),
    fontSize: Dimensions.defaultTextSize * 2,
    fontWeight: FontWeight.w500,
  );
  static var focusHintTextTitle = GoogleFonts.inter(
    color: CustomColor.secondaryTextColor,
    fontSize: Dimensions.defaultTextSize * 1.2,
    fontWeight: FontWeight.w500,
  );

  static var richPreTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.defaultTextSize * 1.3,
    fontWeight: FontWeight.w500,
  );
  static var richTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.defaultTextSize * 1.3,
    fontWeight: FontWeight.w600,
  );

  static var primaryTextStyle = GoogleFonts.inter(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );

  static var secondaryTextStyle = GoogleFonts.inter(
    color: CustomColor.secondaryColor,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );

  static var blackTextStyle = GoogleFonts.inter(
    color: CustomColor.black,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );

  static var grayTextStyle = GoogleFonts.inter(
    color: CustomColor.midGrayColor,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );

  static var whiteTextStyle = GoogleFonts.inter(
    color: CustomColor.white,
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
  );
}
