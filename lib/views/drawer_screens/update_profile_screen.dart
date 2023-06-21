import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/drawer_screen/update_profile_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/buttons/primary_button_widget.dart';
import '../../widgets/country_code_picker_widget.dart';
import '../../widgets/image_view/input_picture_widget.dart';
import '../../widgets/inputs_widgets/phone_number_field.dart';
import '../../widgets/inputs_widgets/primary_input_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
          backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget(
            appTitle: Strings.updateProfile,
          ),
          body: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize * 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Dimensions.heightSize * 2),
            InputImageWidget(),
            SizedBox(height: Dimensions.heightSize * 0.6),
            _inputsFields(context),
            SizedBox(height: Dimensions.heightSize * 2),
          ],
        ),
      ),
    );
  }

  _inputsFields(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              child: PrimaryInputField(
                autofocus: true,
                controller: controller.firstNameController,
                hintText: Strings.enterName,
                labelText: Strings.firsName,
              ),
            ),
            Expanded(
              child: PrimaryInputField(
                autofocus: true,
                controller: controller.lastNameController,
                hintText: Strings.enterName,
                labelText: Strings.lastName,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        PrimaryInputField(
          autofocus: true,
          controller: controller.emailController,
          hintText: Strings.enterEmailAddress,
          labelText: Strings.emailAddress,
          readOnly: true,
          suffixIcon: Container(
            padding: const EdgeInsets.all(17),
            child: SvgPicture.asset(Assets.check),
          ),
        ),
        SizedBox(height: Dimensions.heightSize),
        CountryCodePickerWidget(
          autofocus: true,
          onChanged: (value) {
            controller.code.value = value;
            controller.countryController.text = value.name;
          },
        ),
        SizedBox(height: Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              child: PrimaryInputField(
                autofocus: true,
                controller: controller.stateController,
                hintText: Strings.enterStreet,
                labelText: Strings.state,
              ),
            ),
            Expanded(
              child: PrimaryInputField(
                autofocus: true,
                controller: controller.cityController,
                hintText: Strings.enterCity,
                labelText: Strings.city,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              child: PrimaryInputField(
                autofocus: true,
                controller: controller.streetController,
                hintText: Strings.enterStreet,
                labelText: Strings.street,
              ),
            ),
            Expanded(
                child: PrimaryInputField(
              autofocus: true,
              controller: controller.zipCodeController,
              hintText: Strings.enterZipCode,
              labelText: Strings.zipCode,
            )),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Obx(() => PhoneNumberField(
              autofocus: true,
              controller: controller.numberController,
              hintText: Strings.enterPhoneNumber,
              labelText: Strings.phoneNumber,
              code: controller.code.value,
            )),
        SizedBox(height: Dimensions.heightSize * 2),
        PrimaryButtonWidget(
          onTap: () {
            controller.goToDashboard();
          },
          text: Strings.updateProfile,
        )
      ],
    );
  }
}
