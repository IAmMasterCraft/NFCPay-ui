import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText, labelText;


  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PasswordInputField> {
  FocusNode? focusNode;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.widthSize * 1.2
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.widthSize * 1.2
      ),
      decoration: BoxDecoration(
        color: focusNode!.hasFocus
            ? Colors.transparent
            : CustomColor.elGrayColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
        border: focusNode!.hasFocus
            ? Border.all(
                width: 2,
                color: CustomColor.primaryColor
            )
            : Border.all(
                width: 2,
                color: Colors.transparent
            ),
      ),
      child: TextFormField(
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
             style: CustomStyle.primaryTextStyle
            .copyWith(fontSize: Dimensions.defaultTextSize * 1.6),
        controller: widget.controller,

        onTap: (){
          setState(() {
            focusNode!.requestFocus();
          });
        },
        onFieldSubmitted: (value){
          setState(() {
            focusNode!.unfocus();
          });
        },
        focusNode: focusNode,
        textAlign: TextAlign.left,

        decoration: InputDecoration(
          hintText: widget.hintText,
             hintStyle: GoogleFonts.inter(
            color: CustomColor.primaryColor.withOpacity(0.3),
            fontSize: Dimensions.defaultTextSize * 1.7,
            fontWeight: FontWeight.w500,
          ),
          labelText: widget.labelText,
          labelStyle: GoogleFonts.inter(
            color: CustomColor.primaryTextColor.withOpacity(0.4),
            fontSize: Dimensions.defaultTextSize * 2,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: GoogleFonts.inter(
            color: CustomColor.primaryColor,
            fontSize: Dimensions.defaultTextSize * 1.2,
            fontWeight: FontWeight.w500,
          ),

          contentPadding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5
          ),

          suffixIcon: IconButton(
            icon: Icon( obscureText
                ? Icons.visibility
                : Icons.visibility_off,
              color: focusNode!.hasFocus
                  ?CustomColor.primaryColor: CustomColor.primaryTextColor.withOpacity(0.3),
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),

          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: Colors.transparent
            ),
          ),

          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: Colors.transparent
            ),
          ),

        ),
      ),
    );
  }
}
