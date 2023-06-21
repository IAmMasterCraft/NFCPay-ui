import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class SignUpController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  final countryController = TextEditingController();

  RxBool isChecked = false.obs;
  RxBool isSelected = true.obs;
  RxString code = '+1'.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    countryController.dispose();
    super.dispose();
  }


  void signUpMethod() {
    Get.offNamed(Routes.otpSignUpScreen);
  }
}