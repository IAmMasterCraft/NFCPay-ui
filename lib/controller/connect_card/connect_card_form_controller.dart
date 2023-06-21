import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class CardFormController extends GetxController{
  final acNameController = TextEditingController();
  final acNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvcController = TextEditingController();

  RxString appBarName = 'Mastercard'.obs;

  @override
  void dispose() {
    acNameController.dispose();
    acNumberController.dispose();
    expiryDateController.dispose();
    cvcController.dispose();
    super.dispose();
  }

  void saveCardMethod() {
    Get.offAllNamed(Routes.btmNavScreen);
  }
}