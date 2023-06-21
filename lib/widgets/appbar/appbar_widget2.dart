import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class AppBarWidget2 extends AppBar {
  final String appTitle, buttonText;
  final VoidCallback? onTap;
   AppBarWidget2({
      super.key,
      required this.appTitle,
      this.buttonText = '',
      this.onTap
   }): super(
     backgroundColor: Colors.transparent,
     centerTitle: true,
     title: Text(
       appTitle.tr,
        style: GoogleFonts.inter(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w500
      ),
     ),
     elevation: 0,
     automaticallyImplyLeading: false,
   
   );
}
