import 'package:flutter/material.dart';
import 'package:nfc_pay/utils/assets.dart';
import 'package:nfc_pay/utils/dimensions.dart';

import '../../utils/custom_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.splashBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
            child: Image.asset(Assets.splashIconLogo,
            
            height: Dimensions.heightSize*8,
            width: MediaQuery.of(context).size.width*0.9,
            )
        ),
        bottomNavigationBar: const SizedBox(
          width: double.infinity,
          height: 2,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                color: CustomColor.primaryColor,
              )
          ),
        ),
      ),
    );
  }

}
