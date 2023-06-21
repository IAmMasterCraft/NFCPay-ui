import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/btm/btm_nav_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/btm_appbar_widget.dart';
import 'drawer_widget.dart';

class BTMNavScreen extends StatelessWidget {
  BTMNavScreen({Key? key}) : super(key: key);
  final controller = Get.put(BTMNavController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomStyle.bgDecoration1,
      child: Scaffold(
           backgroundColor: CustomColor.white.withOpacity(0.75),
        key: scaffoldKey,
        appBar: BTMAppBarWidget(
          drawerTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          appTitle: Obx(
            () => controller.selectedIndex.value == 0
                ? Image.asset(
                    Assets.logo,
                    scale: 7,
                  )
                : Text(
                    Strings.myCards,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.defaultTextSize * 2.5,
                      color: CustomColor.primaryTextColor,
                    ),
                  ),
          ),
        ),
        drawer: const DrawerWidget(),
        body: Obx(
          () => controller.body[controller.selectedIndex.value],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _middleButton(context),
        bottomNavigationBar: Obx(() => _bottomNavigationAppBar(context)),
      ),
    );
  }

  _middleButton(BuildContext context) {
    return Container(
      height: Dimensions.heightSize * 4.8,
      width: Dimensions.heightSize * 4.8,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 10),
          color: CustomColor.secondaryColor.withOpacity(0.5)),
      child: SizedBox(
        height: Dimensions.heightSize * 4,
        width: Dimensions.heightSize * 4,
        child: FloatingActionButton(
          backgroundColor: CustomColor.secondaryColor,
          elevation: 2,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                Assets.payment,
              ),
            ),
          ),
          onPressed: () {
            controller.goToPaymentScreen();
          },
        ),
      ),
    );
  }

  _bottomNavigationAppBar(context) {
    return SizedBox(
      width: double.infinity,
      height: Dimensions.heightSize * 5,
      child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.hardEdge,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius * 2),
                topLeft: Radius.circular(Dimensions.radius * 2),
              ),
            ),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    controller.selectedIndex.value = 0;
                  },
                  child: SvgPicture.asset(Assets.home,
                      // ignore: deprecated_member_use
                      color: controller.selectedIndex.value == 0
                          ? CustomColor.white
                          : CustomColor.white.withOpacity(0.4)),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      Strings.payment.toUpperCase(),
                      style: GoogleFonts.inter(
                        color: CustomColor.white,
                        fontSize: Dimensions.defaultTextSize * 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )),
                InkWell(
                  onTap: () {
                    controller.selectedIndex.value = 1;
                  },
                  child: SvgPicture.asset(Assets.myCards,
                      // ignore: deprecated_member_use
                      color: controller.selectedIndex.value == 1
                          ? CustomColor.white
                          : CustomColor.white.withOpacity(0.4)),
                ),
              ],
            ),
          )),
    );
  }
}
