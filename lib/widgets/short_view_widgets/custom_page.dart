import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
 import '../../utils/size.dart';
import '../buttons/primary_button_widget.dart';


class CustomPage extends StatelessWidget {
  final String imageIconPath, title, subTitle, buttonText;
  final VoidCallback? buttonTap;
  final Widget widget;
  final MainAxisSize mainAxisSize;
  final Color color;
  const CustomPage({
    Key? key,
    required this.imageIconPath,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.buttonTap,
    required this.widget,
    this.mainAxisSize =  MainAxisSize.min,
    this.color = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.3,
          vertical: Dimensions.defaultPaddingSize * 0.5,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius * 3),
          topLeft: Radius.circular(Dimensions.radius * 3),
        )
      ),
      child: Column(
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(height: Dimensions.heightSize * 2),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.widthSize
            ),
            child: Image.asset(
                imageIconPath,
              scale: 1,
            ),
          ),

          Column(mainAxisAlignment: mainCenter,
            children: [
              SizedBox(height: Dimensions.heightSize*2,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: Dimensions.defaultTextSize*2,
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
                    fontSize: Dimensions.defaultTextSize*1.5,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.primaryTextColor),
              ),
            ],
          ),

          SizedBox(height: Dimensions.heightSize * 0.8),
          widget,
          SizedBox(height: Dimensions.heightSize * 0.8),

          PrimaryButtonWidget(
            text: buttonText,
            onTap: buttonTap!,
          ),

        ],
      ),
    );
  }
}
