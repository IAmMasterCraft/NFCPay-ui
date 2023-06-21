import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/sign_in/reset_password_controller.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../widgets/appbar/appbar_widget.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/inputs_widgets/password_input_field.dart';
import 'reset_password_confirm_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final controller = Get.put(ResetPasswordController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: CustomStyle.bgDecoration2,
      child: Scaffold(
        backgroundColor: CustomColor.white.withOpacity(0.7),
        appBar: AppBarWidget(
          appTitle: Strings.resetPassword,
        ),
        body: SingleChildScrollView(
          child: _bodyWidget(context),
        ),
      ),
    ));
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.2),
      child: Column(
        children: [
          SizedBox(height: Dimensions.heightSize),
          PasswordInputField(
            controller: controller.passwordController,
            hintText: Strings.enterNewPassword,
            labelText: Strings.newPassword,
          ),
          SizedBox(height: Dimensions.heightSize),
          PasswordInputField(
            controller: controller.confirmPasswordController,
            hintText: Strings.enterConfirmPassword,
            labelText: Strings.confirmPassword,
          ),
          SizedBox(height: Dimensions.heightSize * 3),
          PrimaryButtonWidget(
              text: Strings.resetPassword,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return const ResetPasswordConfirmScreen();
                    });
              })
        ],
      ),
    );
  }
}
