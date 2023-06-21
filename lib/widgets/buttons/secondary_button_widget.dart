import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';


class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final bool dropDown;
  final VoidCallback onTap;
  const SecondaryButtonWidget({Key? key,
    required this.text,
    required this.onTap,
    this.dropDown = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Dimensions.buttonHeight * 1,
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(Dimensions.radius * 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
            ),
            dropDown
                ? const Icon(
                Icons.arrow_drop_down,
              color: Colors.white,
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
