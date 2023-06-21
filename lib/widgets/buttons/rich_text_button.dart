import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_style.dart';


class RichTextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final AlignmentGeometry align;
  final String preText, buttonText;
  const RichTextButtonWidget({
    Key? key,
    required this.onTap,
    required this.preText,
    required this.buttonText,
    this.align = Alignment.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: RichText(
        text: TextSpan(
          text: preText,
          style: CustomStyle.richPreTextStyle,
          children: <TextSpan>[
            TextSpan(
              text: buttonText,
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
              style: CustomStyle.richTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
