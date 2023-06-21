import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';


class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        
        onPressed: onPressed,
        child: Text(
            buttonText,
       style: GoogleFonts.inter(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.defaultTextSize * 1.3,
    fontWeight: FontWeight.w500,
  ),
        ),
      ),
    );
  }
}
