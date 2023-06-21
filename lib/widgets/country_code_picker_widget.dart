import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:nfc_pay/utils/dimensions.dart';

import '../utils/custom_style.dart';
import '../utils/strings.dart';
import 'inputs_widgets/primary_input_field.dart';


class CountryCodePickerWidget extends StatelessWidget {
  final ValueChanged onChanged;
  final bool autofocus;
  const CountryCodePickerWidget({
    Key? key,
    required this.onChanged,
    this.autofocus = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PrimaryInputField(
          autofocus: autofocus,
          readOnly: true,
          controller: TextEditingController(text: ' '),
          hintText: Strings.country,
          labelText: Strings.country,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.widthSize * 1.5,
            right: Dimensions.widthSize,
            top: Dimensions.heightSize,
          ),
          child: CountryCodePicker(
            showOnlyCountryWhenClosed: true,
            showDropDownButton: false,
            showFlag: false,
            alignLeft: true,
            enabled: true,
            textStyle: CustomStyle.primaryTextStyle.copyWith(
              fontSize: Dimensions.defaultTextSize * 1.6
            ),
            initialSelection: "United States",
            backgroundColor: Colors.white,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
