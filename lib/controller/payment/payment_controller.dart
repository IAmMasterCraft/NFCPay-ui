
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';


class PaymentController extends GetxController{

  RxDouble progressValue = 0.0.obs;

  @override
  void onInit() {
    getLoading();
    super.onInit();
  }

  void getLoading() async{

    while(progressValue.value <= 1){
      debugPrint(progressValue.value.toString());
      await Future.delayed(const Duration(milliseconds: 100));
      progressValue.value += 0.05;
    }

    Get.toNamed(Routes.paymentConfirmationScreen);
  }
}