import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/connect_card/connect_card_form_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/buttons/primary_button_widget.dart';
import '../../widgets/card_expiry/card_expiry_widget.dart';
import '../../widgets/inputs_widgets/primary_input_field.dart';
import 'card_bottom_sheet.dart';

class ConnectCardFormScreen extends StatelessWidget {
  ConnectCardFormScreen({Key? key}) : super(key: key);

  final controller = Get.put(CardFormController());

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
          controller: controller.acNameController,
          hintText: Strings.enterAcName,
          labelText: Strings.acName,
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),

        PrimaryInputField(
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
                controller: controller.expiryDateController,
              ),
            ),
            SizedBox(
              width: Dimensions.widthSize,
            ),
            Expanded(
              child: PrimaryInputField(
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
        PrimaryButtonWidget(
          onTap: () {
           showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return const CardBottomSheet();
                });
          },
          text: Strings.saveCard,
        ),

        SizedBox(
          height: Dimensions.heightSize,
        ),
      ],
    );
  }
}
