import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class SecondaryButtonWidget2 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;
  final bool isMain;
  const SecondaryButtonWidget2(
      {Key? key,
      required this.text,
      required this.onTap,
      this.isPrimary = true,
      this.isMain = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 1),
        width: double.infinity,
        height: Dimensions.buttonHeight * 0.85,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isPrimary ? CustomColor.primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: CustomStyle.whiteTextStyle.copyWith(
            fontSize: Dimensions.defaultTextSize * 1.8,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
