import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/onboard_data.dart';
import '../helpers/local_storage.dart';
import '../routes/routes.dart';

class OnBoardController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedIndex.value == onboardData.length;
  bool get isFirstPage => selectedIndex.value == 0;
  bool get isSecondPage => selectedIndex.value == 1;


  void nextPage() {
    if (isLastPage) {
      debugPrint('Next Page Done');
      pageNavigate();
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }


  pageNavigate() {
    Get.offAllNamed(Routes.signInScreen);
  }

  void gotoPageChange() {
    LocalStorage.saveOnboardDoneOrNot(isOnBoardDone: true);
    isFirstPage ||isSecondPage || isLastPage ? nextPage() : pageNavigate();
  }
}
