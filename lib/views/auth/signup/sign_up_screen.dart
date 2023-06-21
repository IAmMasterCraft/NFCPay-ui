import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_pay/routes/routes.dart';
import 'package:nfc_pay/utils/size.dart';

import '../../../controller/auth/signup/signup_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/buttons/rich_text_button.dart';
import '../../../widgets/country_code_picker_widget.dart';
import '../../../widgets/inputs_widgets/password_input_field.dart';
import '../../../widgets/inputs_widgets/phone_number_field.dart';
import '../../../widgets/inputs_widgets/primary_input_field.dart';
import '../../../widgets/others/custom_check_box.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final controller = Get.put(SignUpController());

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
        _inputField(context),
        _privacyPolicy(context),
        _button(context),
      ],
    );
  }

  _imageWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSize * 3,
        bottom: Dimensions.marginSize * 2,
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
              fontSize: Dimensions.extraSmallTextSize - 2,
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
          Strings.signUpTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: Dimensions.largeTextSize + 6,
            fontWeight: FontWeight.w700,
            color: CustomColor.primaryTextColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
          child: Text(
            Strings.signUpSubTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: Dimensions.smallTextSize + 1,
              fontWeight: FontWeight.w400,
              color: CustomColor.primaryTextColor,
            ),
          ),
        ),
        addVerticalSpace(Dimensions.heightSize * 2),
      ],
    );
  }

  _inputField(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PrimaryInputField(
                controller: controller.firstNameController,
                hintText: Strings.enterName,
                labelText: Strings.firsName,
              ),
            ),
            SizedBox(
              width: Dimensions.widthSize,
            ),
            Expanded(
              child: PrimaryInputField(
                controller: controller.lastNameController,
                hintText: Strings.enterName,
                labelText: Strings.lastName,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        PrimaryInputField(
          controller: controller.emailController,
          hintText: Strings.enterEmailAddress,
          labelText: Strings.emailAddress,
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        CountryCodePickerWidget(
          autofocus: true,
          onChanged: (value) {
            controller.code.value = value;
            controller.countryController.text = value.name;
          },
        ),
        SizedBox(
          height: Dimensions.heightSize * 0.2,
        ),
        Obx(() => PhoneNumberField(
              autofocus: false,
              controller: controller.numberController,
              hintText: Strings.enterPhoneNumber,
              labelText: Strings.phoneNumber,
              code: controller.code.value,
            )),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        PasswordInputField(
          controller: controller.passwordController,
          labelText: Strings.enterPassword,
          hintText: Strings.password,
        ),addVerticalSpace(Dimensions.heightSize*0.5)
      ],
    );
  }

  _privacyPolicy(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.only(left: Dimensions.defaultPaddingSize*0.7),
        child: Row(
          children: [
           GradientCheckWidget(
                isChecked: controller.isSelected,
                onChecked: (value) {
                  controller.isSelected.value = value;
                },
              ),
            
            Padding(
              padding:
                  EdgeInsets.only(left:Dimensions.defaultPaddingSize*0.2,right: Dimensions.defaultPaddingSize * 0.3),
              child: RichTextButtonWidget(
                align: Alignment.centerLeft,
                onTap: () {
                  debugPrint('PP and UA Pressed');
                },
                preText: 'I agree to NFCPay ',
                buttonText: 'Privacy Policy & User Agreement.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _button(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.heightSize * 1.5,
        ),
        PrimaryButtonWidget(
          onTap: () {
            controller.signUpMethod();
          },
          text: Strings.signUp,
        ),
        SizedBox(
          height: Dimensions.heightSize * 4,
        ),
        RichTextButtonWidget(
          align: Alignment.bottomCenter,
          onTap: () {
            Get.toNamed(Routes.signInScreen);
          },
          preText: Strings.alreadyHaveAnAccount,
          buttonText: Strings.signIn,
        ),
        SizedBox(
          height: Dimensions.heightSize * 4,
        ),
      ],
    );
  }
}
