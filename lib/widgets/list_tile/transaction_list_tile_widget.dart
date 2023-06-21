import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class TransactionListTileWidget extends StatelessWidget {
  final String title, subTitle, date, balance;
  final Decoration? decoration;

  const TransactionListTileWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.balance,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.widthSize,
          vertical: Dimensions.heightSize,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          
         boxShadow: [
          
            BoxShadow(color: Colors.white.withOpacity(0.1),),
          BoxShadow(color: Colors.white.withOpacity(0.05),),
         ],
          borderRadius: BorderRadius.circular(
            Dimensions.radius * 0.5,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColor.white.withOpacity(0.2),
              CustomColor.white.withOpacity(0.06),
            ],
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.paymentHistory),
            SizedBox(width: Dimensions.widthSize),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomStyle.blackTextStyle
                        .copyWith(fontSize: Dimensions.defaultTextSize * 1.4),
                  ),
                  SizedBox(height: Dimensions.heightSize*0.6),
                  Text(
                    subTitle,
                    style: CustomStyle.grayTextStyle
                        .copyWith(fontSize: Dimensions.defaultTextSize * 1.4),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: CustomStyle.grayTextStyle.copyWith(
                        fontSize: Dimensions.defaultTextSize * 1.2,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Dimensions.heightSize*0.6),
                  Text(
                    balance,
                    style: CustomStyle.primaryTextStyle.copyWith(
                        fontSize: Dimensions.defaultTextSize * 1.6,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      
    );
  }
}
