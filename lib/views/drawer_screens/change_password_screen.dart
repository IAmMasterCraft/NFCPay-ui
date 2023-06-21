import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_pay/routes/routes.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../widgets/appbar/appbar_widget.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/inputs_widgets/password_input_field.dart';
import '../../controller/drawer_screen/change_controller.dart';
import '../../utils/custom_color.dart';


class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final controller = Get.put(ChangePasswordController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: CustomStyle.bgDecoration2,
      child: Scaffold(
          backgroundColor: CustomColor.white.withOpacity(0.7),
        appBar: AppBarWidget(
          appTitle: Strings.changePassword,
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
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.25),
      child: Column(
        children: [
          SizedBox(height: Dimensions.heightSize),
          PasswordInputField(
            controller: controller.oldPasswordController,
            hintText: Strings.enterOldPassword,
            labelText: Strings.oldPassword,
          ),
          SizedBox(height: Dimensions.heightSize),
          PasswordInputField(
            controller: controller.newPasswordController,
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
              text: Strings.changePassword,
              onTap: () {
                Get.offAndToNamed(Routes.btmNavScreen);
              })
        ],
      ),
    );
  }
}
