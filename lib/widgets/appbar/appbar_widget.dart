import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';


class AppBarWidget extends AppBar {
  final String appTitle;
   AppBarWidget({super.key,  required this.appTitle}): super(
     backgroundColor: Colors.transparent,
     title: Text(
       appTitle.tr,
        style:GoogleFonts.inter(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w500,
      ),
     ),
     elevation: 0,
     automaticallyImplyLeading: false,
     leading: IconButton(
        onPressed: (){
          Get.back();
        },
        icon: SvgPicture.asset(Assets.backward)
    )
   );
}
