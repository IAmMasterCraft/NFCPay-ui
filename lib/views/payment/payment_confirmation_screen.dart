import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/short_view_widgets/custom_page.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
          backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget(
            appTitle: Strings.payment,
          ),
          body: CustomPage(
            mainAxisSize: MainAxisSize.max,
            color: Colors.transparent,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _recipTile(title: Strings.recipient, subTitle: 'Sayok M.'),
                _recipTile(
                    title: Strings.emailAddress, subTitle: 'sayokm@gmail.com'),
                Divider(
                  color: CustomColor.primaryColor.withOpacity(0.5),
                  thickness: 2,
                ),
                _recipTile(title: Strings.bill, subTitle: '100.00 USD'),
                _recipTile(title: Strings.charge, subTitle: '2.00 USD'),
                _recipTile(
                    title: Strings.payableAmount, subTitle: '102.00 USD'),
              ],
            ),
            title: Strings.congratulations,
            subTitle: Strings.paymentSuccessSubTitle,
            buttonText: Strings.backToHome,
            imageIconPath: Assets.confirmation,
            buttonTap: () {
              Get.offAllNamed(Routes.btmNavScreen);
            },
          ),
        ),
      ),
    );
  }

  _recipTile({required String title, required String subTitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(title,
                textAlign: TextAlign.right,
                style: CustomStyle.secondaryTextStyle.copyWith(
                    fontSize: Dimensions.defaultTextSize * 1.2,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(width: Dimensions.widthSize * 2),
          Expanded(
            flex: 3,
            child: Text(subTitle,
                textAlign: TextAlign.left,
                style: CustomStyle.blackTextStyle.copyWith(
                    fontSize: Dimensions.defaultTextSize * 1.6,
                    fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }
}
