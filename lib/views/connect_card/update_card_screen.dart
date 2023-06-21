import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/connect_card/update_card_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/buttons/secondery_color.dart';
import '../../widgets/card_expiry/card_expiry_widget.dart';
import '../../widgets/inputs_widgets/primary_input_field.dart';

class UpdateCardScreen extends StatelessWidget {
  UpdateCardScreen({Key? key}) : super(key: key);

  final controller = Get.put(UpdateCardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
              backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget(
            appTitle: controller.appBarName.value,
          ),
          body: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        PrimaryInputField(
          autofocus: true,
          controller: controller.acNameController,
          hintText: Strings.enterAcName,
          labelText: Strings.acName,
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),

        PrimaryInputField(
          autofocus: true,
          keyboardType: TextInputType.number,
          controller: controller.acNumberController,
          hintText: Strings.enterAcNumber,
          labelText: Strings.acNumber,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16) //max length of 12 characters
          ],
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
        Row(
          children: [
            Expanded(
              child: CardExpiryDate(
                autofocus: true,
                controller: controller.expiryDateController,
              ),
            ),
            SizedBox(
              width: Dimensions.widthSize,
            ),
            Expanded(
              child: PrimaryInputField(
                autofocus: true,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3) //max length of 12 characters
                ],
                keyboardType: TextInputType.number,
                controller: controller.cvcController,
                hintText: 'CVC/CVV',
                labelText: 'CVC/CVV',
              ),
            ),
          ],
        ),

        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        Row(
          children: [
            Expanded(
              child: SecondaryButtonWidget2(
                onTap: () {
                  controller.saveCardMethod();
                },
                text: Strings.removeCard,
                isPrimary: false,
              ),
            ),

            SizedBox(
              width: Dimensions.widthSize * 1,
            ),

            Expanded(
              child: SecondaryButtonWidget2(
                onTap: () {
                  controller.saveCardMethod();
                },
                text: Strings.updateCard,
              ),
            ),
          ],
        ),

        SizedBox(
          height: Dimensions.heightSize,
        ),
      ],
    );
  }
}
