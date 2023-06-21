import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nfc_pay/utils/size.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class DrawerListWidget extends StatelessWidget {
  final String assetName, text;
  final VoidCallback onTab;
  const DrawerListWidget({
    Key? key,
    required this.assetName,
    required this.onTab,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTab,
      child: Container(
        margin: EdgeInsets.only(left: Dimensions.defaultPaddingSize*0.9,
        top: Dimensions.defaultPaddingSize*0.46
        ),
        child: Row(
          children: [
            SvgPicture.asset(assetName,
            height: 31,width: 31,),
            addHorizontalSpace(Dimensions.widthSize*1.1),
            Text(
              text,
              textAlign: TextAlign.left,
              style: CustomStyle.primaryTextStyle
                  .copyWith(fontSize: Dimensions.defaultTextSize * 1.6),
            )
          ],
        ),
      ),
    );
  }
}
