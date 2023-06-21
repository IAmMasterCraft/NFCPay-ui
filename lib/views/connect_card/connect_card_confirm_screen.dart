import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../routes/routes.dart';
import '../../../utils/assets.dart';
import '../../../utils/strings.dart';
import '../../../widgets/short_view_widgets/custom_page.dart';
import '../../helpers/local_storage.dart';

class ConnectCardConfirmScreen extends StatelessWidget {
  const ConnectCardConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return CustomPage(
      widget: const SizedBox(),
      title: Strings.congratulations,
      subTitle: Strings.connectCardCongratulations,
      buttonText: Strings.okay,
      imageIconPath: Assets.confirmation,
      buttonTap: (){
        LocalStorage.loggedIn(isLoggedIn: true);
        Get.offAllNamed(Routes.btmNavScreen);
      },
    );
  }
}
