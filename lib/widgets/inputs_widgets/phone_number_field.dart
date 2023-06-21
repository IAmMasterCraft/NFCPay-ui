import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';


class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText, labelText, code;
  final bool autofocus;


  const PhoneNumberField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.code,
    required this.labelText,
    this.autofocus = false
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  FocusNode? focusNode;

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
        color: widget.autofocus
            ? Colors.transparent
            : focusNode!.hasFocus
            ? Colors.transparent
            : CustomColor.elGrayColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
        border: widget.autofocus
            ? Border.all(
            width: 2,
            color: CustomColor.primaryColor
        )
            :focusNode!.hasFocus
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
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
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

        style: CustomStyle.primaryTextStyle.copyWith(
          fontSize: Dimensions.defaultTextSize * 1.6
        ),

        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(
            color: Colors.black.withOpacity(0.4),
            fontSize: Dimensions.defaultTextSize * 1.7,
            fontWeight: FontWeight.w500,
          ),

          labelText: widget.labelText,
          labelStyle: GoogleFonts.inter(
            color: Colors.black.withOpacity(0.4),
            fontSize: Dimensions.defaultTextSize * 2,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: GoogleFonts.inter(
            color: CustomColor.primaryColor,
            fontSize: Dimensions.defaultTextSize * 2,
            fontWeight: FontWeight.w500,
          ),

          prefix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.code,
               style: CustomStyle.primaryTextStyle.copyWith(
                 fontSize: Dimensions.defaultTextSize * 1.6
               ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 3
                ),
                width: 2,
                height: 20,
                color: CustomColor.primaryColor,
              )
            ],
          ),

          contentPadding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5
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
