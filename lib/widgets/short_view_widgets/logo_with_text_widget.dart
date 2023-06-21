import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import 'title_subtitle.dart';

class LogoWithTextsWidget extends StatelessWidget {
  final String title, subTitle;
  const LogoWithTextsWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.logo,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const Text(Strings.easyPaymentsAnytimeAnywhere),
          ],
        ),

        TitleSubTitle(
            title: title,
            subTitle: subTitle
        ),

        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
      ],
    );
  }
}
