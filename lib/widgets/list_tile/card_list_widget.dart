import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class CardListWidget extends StatelessWidget {
  final int index;
  final String cardCvc, expiryDate, cardNo, cardName;
  final double cardNoScale, heightScale;
  final EdgeInsetsGeometry? padding;
  const CardListWidget({
    Key? key,
    required this.index,
    required this.cardCvc,
    required this.cardName,
    required this.cardNo,
    required this.expiryDate,
    this.cardNoScale = 1,
    this.padding,
    this.heightScale = 0.3
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * heightScale,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius *1.5),
          image: DecorationImage(
              image: AssetImage(
                  index == 0
                      ? Assets.card1
                      : index == 1
                      ? Assets.card2
                      : index == 2
                      ? Assets.card3
                      : index % 2 == 0
                      ? Assets.card1
                      : index % 3 == 0
                      ? Assets.card2 : Assets.card3
              ),
              fit: BoxFit.fill
          )
      ),

      child: Stack(
        children: [

          Positioned(
            top: 38,
            left: 45,
            child: Text(
              cardName,
              style: CustomStyle.whiteTextStyle.copyWith(
                  fontSize: Dimensions.defaultTextSize * 2,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(
                top: Dimensions.heightSize * 3
            ),
            alignment: Alignment.center,
            child: Text(
              cardNo,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.teko(
                  fontWeight: FontWeight.w700,
                  fontSize: Dimensions.defaultTextSize * 2.8 * cardNoScale,
                  letterSpacing: 3,
                  color: CustomColor.white.withOpacity(0.6)
              ),
            ),
          ),

          Positioned(
            bottom: 32,
            left: 45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expiryDate,
                  style: CustomStyle.whiteTextStyle.copyWith(
                    fontSize: Dimensions.defaultTextSize * 2,
                  ),
                ),
                Text(
                  Strings.expiryDate,
                  style: CustomStyle.whiteTextStyle.copyWith(
                      fontSize: Dimensions.defaultTextSize * 1.4,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.white.withOpacity(0.6)
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 32,
            right: 45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  cardCvc,
                  style: CustomStyle.whiteTextStyle.copyWith(
                    fontSize: Dimensions.defaultTextSize * 2,
                  ),
                ),
                Text(
                  Strings.cvc,
                  style: CustomStyle.whiteTextStyle.copyWith(
                      fontSize: Dimensions.defaultTextSize * 1.4,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.white.withOpacity(0.6)
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
