import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_pay/utils/size.dart';
import 'package:nfc_pay/widgets/flutter_custom_keyboard/flutter_custom_keyboard.dart';
import '../../../controller/auth/sign_in/otp_verification_signin_controller.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../widgets/appbar/appbar_widget.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/buttons/text_button_widget.dart';
import '../../../widgets/inputs_widgets/otp_input_text_field.dart';
import '../../../widgets/short_view_widgets/title_subtitle.dart';

class OTPSignInScreen extends StatelessWidget {
  OTPSignInScreen({Key? key}) : super(key: key);

  final controller = Get.put(OTPVerificationSignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
           backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget(
            appTitle: Strings.otpVerification,
          ),
          body: _bodyWidget(),
        ),
      ),
    );
  }

  _bodyWidget() {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.5),
      children: [
        _titleSubTitle(),
        _otpWidget(),
        _keyboardButton(),
      ],
    );
  }

  _titleSubTitle() {
    return const TitleSubTitle(
      title: Strings.verificationCode,
      subTitle: Strings.verificationCodeSubTitle,
    );
  }

  _timer() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.clock),
        const SizedBox(
          width: 15,
        ),
        Obx(() => Text(
              '0${controller.minuteRemaining.value}:${controller.secondsRemaining.value}',
              style: GoogleFonts.inter(
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w600,
                color: CustomColor.primaryColor,
              ),
            ))
      ],
    );
  }

  _otpWidget() {
    return Column(
      children: [
        TextFieldOtp(
          controller: controller.otpController,
          length: 6,
          onChanged: (value) {},
        ),addVerticalSpace(Dimensions.heightSize),
        _timer(),
      ],
    );
  }

  _keyboardButton() {
    return Column(
      children: [
        addVerticalSpace(Dimensions.heightSize*2),
        NumericKeyboardWidget(
          onKeyboardTap: (value) {
            controller.otpController.text += value.toString();
          },
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          rightButtonFn: () {
            controller.otpController.clear();
          },
        ),
        SizedBox(
          height: Dimensions.heightSize * 1.5,
        ),
        PrimaryButtonWidget(
          text: Strings.submit,
          onTap: () {
            controller.submitMethod();
          },
        ),
        Obx(() => Visibility(
              visible: controller.enableResend.value,
              child: TextButtonWidget(
                
                buttonText: Strings.resendCode,
                onPressed: () {
                  controller.resendCode();
                },
              ),
            )),
      ],
    );
  }
}
