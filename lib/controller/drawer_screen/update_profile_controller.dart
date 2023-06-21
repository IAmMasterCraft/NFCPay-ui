import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../input_image_controller.dart';

class UpdateProfileController extends GetxController{

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();

  RxString code = '+1'.obs;

  final imageController = Get.put(InputImageController());


  @override
  void onInit() {
    firstNameController.text = 'Anthony';
    lastNameController.text = 'Golsambir';
    emailController.text = 'anthony@gmail.com';
    numberController.text = '611 2314 549';
    countryController.text = 'United States';
    cityController.text = 'California';
    zipCodeController.text = '15417';
    stateController.text = 'California';
    streetController.text = '417 Water Street';

    super.onInit();
  }


  void goToDashboard() {
    Get.offAllNamed(Routes.btmNavScreen);
  }

}