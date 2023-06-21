import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_pay/utils/dimensions.dart';

import 'package:badges/badges.dart' as badges;
import '../../controller/btm/btm_nav_controller.dart';
import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';



class BTMAppBarWidget extends AppBar {
  final Widget appTitle;
  final VoidCallback drawerTap;
  final controller = Get.put(BTMNavController());
   BTMAppBarWidget({
  super.key,
  required this.appTitle,
  required this.drawerTap,
  }): super(
     backgroundColor: Colors.transparent,
     title: appTitle,
     centerTitle: true,
     elevation: 0,
     automaticallyImplyLeading: false,
     leading: IconButton(
        onPressed: drawerTap,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(Assets.menu),
        )
      ),
     actions: [
        Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widthSize * 0.8),
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 4, end: 7),
                  badgeContent: Container(
                    margin: const EdgeInsets.only(
                      top: 2,
                    ),
                    alignment: Alignment.topCenter,
                    height: 16,
                    child:  Text(
                       '1',
                       style: GoogleFonts.inter(
                        color: CustomColor.white,
                       ),
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.notificationScreen);
                      },
                      icon: SvgPicture.asset(Assets.notification),
                ),
              ),),
     ]
   );
}
