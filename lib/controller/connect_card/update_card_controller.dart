import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class UpdateCardController extends GetxController{
  final acNameController = TextEditingController();
  final acNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvcController = TextEditingController();

  RxString appBarName = 'Update Card'.obs;

  @override
  void onInit() {
    acNameController.text = 'Amandon';
    acNumberController.text = '4768 0989 8978 2378';
    expiryDateController.text = '12-2024';
    cvcController.text = '124';
    super.onInit();
  }

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