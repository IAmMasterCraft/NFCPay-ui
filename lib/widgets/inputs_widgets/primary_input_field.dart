import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PrimaryInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  final bool readOnly, autofocus;
  final Function? onTap;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;

  const PrimaryInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.readOnly = false,
      this.autofocus = false,
      this.onTap,
      this.suffixIcon,
      this.inputFormatters,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  State<PrimaryInputField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PrimaryInputField> {
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
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 1.2),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 1.2),
      decoration: BoxDecoration(
        color: widget.autofocus
            ? Colors.transparent
            : focusNode!.hasFocus
                ? Colors.transparent
                : CustomColor.elGrayColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
        border: widget.autofocus
            ? Border.all(width: 2, color: CustomColor.primaryColor)
            : focusNode!.hasFocus
                ? Border.all(width: 2, color: CustomColor.primaryColor)
                : Border.all(width: 2, color: Colors.transparent),
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        style: CustomStyle.primaryTextStyle
            .copyWith(fontSize: Dimensions.defaultTextSize * 1.6),
        onTap: widget.readOnly
            ? () {
                widget.onTap!();
              }
            : () {
                setState(() {
                  focusNode!.requestFocus();
                });
              },
        onFieldSubmitted: (value) {
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
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
