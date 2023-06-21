import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/local_storage.dart';
import '../../../routes/routes.dart';

class SignInController extends GetxController{
  final emailController = TextEditingController();
  final fotrgotEmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goToOTPScreen() {
    Get.offNamed(Routes.otpSignInScreen);
  }

  void newToNFC() {
    Get.toNamed(Routes.signUpScreen);
  }

  void signInMethod() {
    LocalStorage.loggedIn(isLoggedIn: true);
    LocalStorage.isLoginSuccess(isLoggedIn: true);
    Get.offAllNamed(Routes.btmNavScreen);
  }
}