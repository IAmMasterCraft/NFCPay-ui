import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/list_tile/card_list_widget.dart';

class PaymentSelectCardScreen extends StatelessWidget {
  const PaymentSelectCardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
             backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget(
            appTitle: Strings.selectCard,
          ),
          body: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    RxInt selectedIndex = 0.obs;
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              selectedIndex.value = index+1;
              Timer(const Duration(seconds: 1), () {
                // controller.increseProgressValue();
                Get.toNamed(Routes.paymentScreen, arguments: index);
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CardListWidget(
                  cardCvc: '123',
                  index: index,
                  cardName: 'Amandon Bril',
                  cardNo: '3646 5564 0034 0891',
                  expiryDate: '09/24',
                ),
                Obx(() => Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widthSize * 1.5,
                    right: Dimensions.widthSize * 1.5,
                    bottom: Dimensions.heightSize * 0.5
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widthSize,
                    vertical: Dimensions.heightSize * 6
                  ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius * 1.5),
                          color: selectedIndex.value == index + 1
                              ? CustomColor.black.withOpacity(0.2)
                              : Colors.transparent),
                      child: Visibility(
                        visible: selectedIndex.value == index + 1,
                          child: SvgPicture.asset(Assets.select)
                      ),
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (_, index) {
          return SizedBox(
            height: Dimensions.heightSize * 0,
          );
        },
        itemCount: 3);
  }
}
