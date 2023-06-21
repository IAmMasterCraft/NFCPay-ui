import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/payment/payment_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/list_tile/payment_card_list.dart';
import '../../widgets/short_view_widgets/title_subtitle_widget2.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with SingleTickerProviderStateMixin{
  final controller = Get.put(PaymentController());
  final int index = Get.arguments;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: CustomStyle.bgDecoration2,
        child: Scaffold(
         backgroundColor: CustomColor.white.withOpacity(0.7),
          appBar: AppBarWidget(
            appTitle: Strings.payment,
          ),
          body: Center(
            child: _bodyWidget(context),
          ),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SizedBox(height: Dimensions.heightSize * 0),

        const TitleSubTitle2(
          titleScale: 2.4,
          title: Strings.onProcessing,
          subTitle: Strings.onProcessingSubTitle,
          crossStart: CrossAxisAlignment.center,
        ),


        CustomPaint(
          painter: MyCustomPainter(_animation.value),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.widthSize*3,
                vertical: Dimensions.heightSize * 2
            ),
            child: PaymentCardListWidget(
              cardCvc: '123',
              index: index,
              cardName: 'Amandon Bril',
              cardNo: '3646 5564 0034 0891',
              expiryDate: '09/24',
            ),
          ),
        ),


        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.widthSize * 3
          ),
          child: Obx(() => LinearProgressIndicator(
          
            value: controller.progressValue.value,
            color: CustomColor.primaryColor,
            backgroundColor: CustomColor.black.withOpacity(0.2),
            minHeight: 10,
          )),
        ),

        SizedBox(height: Dimensions.heightSize * 0.5),

      ],
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double animationValue;
  MyCustomPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 3; value >= 0; value--) {
      circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
          value + animationValue);
    }
  }
  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color =  CustomColor.primaryColor.withOpacity((1 - (value / 4)).clamp(.0, 1) * 0.6);
    canvas.drawCircle(rect.center,
        sqrt((rect.width * .5 * rect.width * .5) * value / 4), paint);
  }
  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return true;
  }
}
