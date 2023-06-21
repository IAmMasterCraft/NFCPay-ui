import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/custom_color.dart';

class TextFieldOtp extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final ValueChanged onChanged;


  const TextFieldOtp({
    Key? key,
    required this.controller,
    required this.length,
    required this.onChanged
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDismissKeyboard: true,
      controller: controller,
      appContext: context,
      readOnly: true,
      length: length,
      obscureText: false,
      keyboardType: TextInputType.number,
      textStyle: const TextStyle(color: CustomColor.primaryColor),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(7),
        selectedColor: CustomColor.primaryColor,
        activeColor: CustomColor.primaryColor.withOpacity(0.4),
        inactiveColor: CustomColor.deepGrayColor,
        fieldHeight: 52,
        fieldWidth: 50,
        activeFillColor: Colors.transparent,
      ),
      onChanged: onChanged,
    );
  }
}
