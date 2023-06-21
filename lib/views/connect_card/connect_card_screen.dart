import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/connect_card/connect_card_form_controller.dart';
import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget2.dart';
import '../../widgets/buttons/rich_text_button.dart';

class ConnectCardScreen extends StatelessWidget {
  ConnectCardScreen({Key? key}) : super(key: key);

  final cardController = Get.put(CardFormController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
        backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget2(
            appTitle: Strings.connectCard,
          ),
          body: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Image.asset(Assets.addCard),
        Text(
          Strings.connectYourCard,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: Dimensions.defaultTextSize * 2.4,
              fontWeight: FontWeight.w700,
              color: CustomColor.primaryTextColor),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          Strings.connectYourCardSubTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: Dimensions.defaultTextSize * 1.6,
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryTextColor),
        ),
        RichTextButtonWidget(
          preText: '',
          align: Alignment.center,
          buttonText: Strings.termsAndPrivacy,
          onTap: () {},
        ),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _cardTile(
            iconPath: Assets.mastercard,
            text: Strings.mastercard,
            onTap: () {
              cardController.appBarName.value = 'Mastercard';
              Get.toNamed(Routes.connectCardFormScreen);
            }),
        _cardTile(
            iconPath: Assets.visacard,
            text: Strings.visaCard,
            onTap: () {
              cardController.appBarName.value = 'Visa Card';
              Get.toNamed(Routes.connectCardFormScreen);
            })
      ],
    );
  }

  _cardTile(
      {required String text,
      required String iconPath,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.widthSize,
          vertical: Dimensions.heightSize * 0.5),
      child: ListTile(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE

          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        hoverColor: CustomColor.white.withOpacity(0.3),
        splashColor: CustomColor.white.withOpacity(0.3),
        onTap: onTap,
        leading: SvgPicture.asset(iconPath),
        title: Text(
          text,
          style: GoogleFonts.inter(
              fontSize: Dimensions.defaultTextSize * 1.8,
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryTextColor),
        ),
        trailing: SvgPicture.asset(Assets.forward),
      ),
    );
  }
}
