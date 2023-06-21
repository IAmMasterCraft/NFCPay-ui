import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';

class CustomLoadingAPI extends StatelessWidget {
  const CustomLoadingAPI({
    Key? key,
    this.color = CustomColor.primaryColor,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
