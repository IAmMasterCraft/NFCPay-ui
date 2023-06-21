import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class TitleSubTitle2 extends StatelessWidget {
  final CrossAxisAlignment crossStart;
  final String title, subTitle;
  final double value, titleScale, subTitleScale;

  const TitleSubTitle2({
    Key? key,
    this.crossStart = CrossAxisAlignment.center,
    required this.title,
    required this.subTitle,
    this.value = 1,
    this.titleScale = 2.6,
    this.subTitleScale = 1.6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.defaultPaddingSize * value,
          horizontal: Dimensions.defaultPaddingSize * 0.5),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: Dimensions.defaultTextSize * titleScale,
                fontWeight: FontWeight.w700,
                color: CustomColor.primaryTextColor),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: Dimensions.defaultTextSize * subTitleScale,
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryTextColor),
          ),
        ],
      ),
    );
  }
}
