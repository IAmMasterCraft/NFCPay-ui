import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_pay/widgets/buttons/text_button_widget.dart';
import 'package:nfc_pay/widgets/glass_widget/glass_widget.dart';

import '../../../controller/auth/sign_in/signin_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/buttons/rich_text_button.dart';
import '../../../widgets/inputs_widgets/password_input_field.dart';
import '../../../widgets/inputs_widgets/primary_input_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomStyle.bgDecoration2,
      child: Scaffold(
        backgroundColor: CustomColor.white.withOpacity(0.7),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.2),
      physics: const BouncingScrollPhysics(),
      children: [
        _imageWidget(context),
        _titleSubTitle(context),
        _inputFiled(),
        _button(context),
      ],
    );
  }

  _imageWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 5,
        bottom: Dimensions.marginSize * 3.4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.logo,
            height: Dimensions.heightSize * 6,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Text(
            Strings.easyPaymentsAnytimeAnywhere,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: Dimensions.extraSmallTextSize - 1,
              fontWeight: FontWeight.w400,
              color: CustomColor.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  _titleSubTitle(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.signInTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: Dimensions.largeTextSize + 5,
            fontWeight: FontWeight.w700,
            color: CustomColor.primaryTextColor,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
          child: Text(
            Strings.signInSubTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: Dimensions.smallTextSize + 1,
              fontWeight: FontWeight.w400,
              color: CustomColor.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }

  _inputFiled() {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 1.4,
        bottom: Dimensions.marginSize * 1.1,
      ),
      child: Column(
        children: [
          PrimaryInputField(
            controller: controller.emailController,
            hintText: Strings.enterUserName,
            labelText: Strings.userName,
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          PasswordInputField(
            controller: controller.passwordController,
            labelText: Strings.password,
            hintText: Strings.enterPassword,
          ),
        ],
      ),
    );
  }

  _button(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonWidget(
          onTap: () {
            controller.signInMethod();
          },
          text: Strings.signIn,
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.8,
        ),
        RichTextButtonWidget(
          onTap: () {
            goToForgotPassword(context);
          },
          preText: '',
          buttonText: Strings.forgotPasswordAsk,
        ),
        SizedBox(
          height: Dimensions.heightSize * 5,
        ),
        RichTextButtonWidget(
          align: Alignment.bottomCenter,
          onTap: () {
            controller.newToNFC();
          },
          preText: Strings.newToNFCPay,
          buttonText: Strings.signUp,
        ),
      ],
    );
  }

  goToForgotPassword(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => GestureDetector(
        onTap: () {
          Get.back();
        },
        child: AlertDialog(
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.all(2),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5)),
          content: Builder(builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.86,
              color: CustomColor.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.heightSize * 2.4,
                  ),
                  Text(
                    Strings.forgotPasswordAsk,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: Dimensions.defaultTextSize * 2,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.primaryTextColor),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultPaddingSize * 0.7),
                    child: Text(
                      Strings.forgotPasswordSubTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: Dimensions.defaultTextSize * 1.4,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.primaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 2.7,
                  ),
                  PrimaryInputField(
                    controller: controller.fotrgotEmailController,
                    hintText: Strings.enterEmailAddress,
                    labelText: Strings.emailAddress,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.8),
                  PrimaryButtonWidget(
                      text: Strings.forgotPassword,
                      onTap: () {
                        controller.goToOTPScreen();
                      }),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  TextButtonWidget(
                      onPressed: () {
                        Get.back();
                      },
                      buttonText: Strings.cancel)
                ],
              ),
            );
          }),
        ).customGlassWidget(
          tintColor: Colors.transparent,
          blurX: 3,
          blurY: 3,
        ),
      ),
    );
  }
}
