import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPVerificationSignUpController extends GetxController{
  final otpController = TextEditingController();

  @override
  dispose(){
    otpController.dispose();
    Get.delete<OTPVerificationSignUpController>();
    super.dispose();
  }


  @override
  void onInit() {
    timerInit();
    super.onInit();
  }

  timerInit(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minuteRemaining.value != 0) {
        secondsRemaining.value--;
        if(secondsRemaining.value == 0){
          secondsRemaining.value = 59;
          minuteRemaining.value = 0;
        }
      }
      else if(minuteRemaining.value == 0 && secondsRemaining.value != 0){
        secondsRemaining.value--;
      }
      else {
        enableResend.value = true;
      }
    });
  }


  RxInt secondsRemaining = 59.obs;
  RxInt minuteRemaining = 01.obs;
  RxBool enableResend = false.obs;
  Timer? timer;

  resendCode() {
    secondsRemaining.value = 59;
    enableResend.value = false;
    timerInit();
  }


}