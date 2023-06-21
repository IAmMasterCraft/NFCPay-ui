import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../routes/routes.dart';
import '../../../utils/assets.dart';
import '../../../utils/strings.dart';
import '../../../widgets/short_view_widgets/custom_page.dart';

class ResetPasswordConfirmScreen extends StatelessWidget {
  const ResetPasswordConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return CustomPage(
      widget: const SizedBox(),
      title: Strings.congratulations,
      subTitle: Strings.passwordResetCongratulations,
      buttonText: Strings.signIn,
      imageIconPath: Assets.confirmation,
      buttonTap: (){
        Get.offAllNamed(Routes.signInScreen);
      },
    );
  }
}
