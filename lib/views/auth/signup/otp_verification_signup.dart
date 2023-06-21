import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_pay/widgets/flutter_custom_keyboard/flutter_custom_keyboard.dart';

import '../../../controller/auth/signup/otp_verification_signup_controller.dart';
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
import 'registration_confirm_screen.dart';


class OTPSignUpScreen extends StatelessWidget {
  OTPSignUpScreen({Key? key}) : super(key: key);

  final controller = Get.put(OTPVerificationSignUpController());

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
          body: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleSubTitle(
            title: Strings.verificationCode,
            subTitle: Strings.verificationCodeSubTitle,
            subTitleScale: 1.4,
          ),

          TextFieldOtp(
            controller: controller.otpController,
            length: 6,
            onChanged: (value){

            },
          ),

          _timer(),

          Column(
            children: [

              NumericKeyboardWidget(
                  onKeyboardTap: (value){
                    controller.otpController.text += value.toString();
                  },
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                rightButtonFn: (){
                  controller.otpController.clear();
                },
              ),

              SizedBox(
                height: Dimensions.heightSize * 2,
              ),

              PrimaryButtonWidget(
                text: Strings.submit,
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,

                      builder: (context){
                        return const RegistrationConfirmScreen();
                      }
                  );
                },
              ),

              Obx(() => Visibility(
                visible: controller.enableResend.value,
                child: TextButtonWidget(
                  buttonText: Strings.resendCode,
                  onPressed: (){
                    controller.resendCode();
                  },
                ),
              )),
            ],
          ),

          ],
        ),
      );
  }

  _timer() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.clock),
        const SizedBox(
          width: 5,
        ),

        Obx(() => Text(
          '0${controller.minuteRemaining.value}:${controller.secondsRemaining.value}',
          style: GoogleFonts.inter(
                fontSize: Dimensions.smallTextSize ,
                fontWeight: FontWeight.w600,
                color: CustomColor.primaryColor,
              ),
        ))
      ],
    );
  }

}
