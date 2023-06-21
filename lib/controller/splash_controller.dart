import 'dart:async';

import 'package:get/get.dart';

import '../helpers/local_storage.dart';
import '../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
        const Duration(seconds: 3),
        () => LocalStorage.isLoggedIn()
            ? Get.offAndToNamed(
                Routes.btmNavScreen,
              )
            : LocalStorage.isOnBoardDone()
                ? Get.offAndToNamed(
                    Routes.signInScreen,
                  )
                : Get.offAndToNamed(
                    Routes.onboardScreen,
                  ));
  }
}
