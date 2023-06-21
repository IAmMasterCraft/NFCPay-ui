import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../views/btm/dashboard_screen.dart';
import '../../views/btm/mycards_screen.dart';

class BTMNavController extends GetxController{
  final RxInt selectedIndex = 0.obs;
  final List body = [
    DashboardScreen(),
    MyCardsScreen(),
  ];

  goToPaymentScreen() {
    Get.toNamed(Routes.paymentSelectCardScreen);
  }
}