import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: Dimensions.heightSize * 2),
        child: Text(
          'No Data Available Yet',
          style: TextStyle(
            color: CustomColor.primaryColor,
            fontSize: Dimensions.largeTextSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
