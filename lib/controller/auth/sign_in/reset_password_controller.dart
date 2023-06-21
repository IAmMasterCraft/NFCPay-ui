import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPasswordController extends GetxController{
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  void openSuccessfullDialog() {
    // Get.offNamedUntil(Routes.resetPasswordConfirmScreen, (route) => false);
  }

}