import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/btm/dashboard_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/card_slider_widget/card_swipper.dart';
import '../../widgets/list_tile/card_list_widget.dart';
import '../../widgets/list_tile/transaction_list_tile_widget.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [

            Expanded(
                flex: 5,
                child: CardSwiperWidget(
                  itemDot: (value)=> const SizedBox(),
                  cards: List.generate(4, (index) => CardListWidget(
                    cardNoScale: 0.8,
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.heightSize * 0,
                    ),
                    cardCvc: '123',
                    index: index,
                    cardName: 'Amandon Bril',
                    cardNo: '3646 5564 0034 0891',
                    expiryDate: '09/24',
                  )),
                )
            ),

            const Expanded(
              flex: 6,
                child: SizedBox()
            )
          ],
        ),
         _draggableSheet(context),
      ],
    );
  }

  _draggableSheet(BuildContext context) {
    return DraggableScrollableSheet(

      builder: (_, scrollController){
        return _transactionHistoryWidget(context, scrollController);
      },
      initialChildSize: 0.55,
      minChildSize: 0.55,
      maxChildSize: 0.95,
    );
  }

  _transactionHistoryWidget(BuildContext context, scrollController) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 0.5,
        left: Dimensions.defaultPaddingSize * 0.1,
        right: Dimensions.defaultPaddingSize * 0.1,
      ),
      decoration: BoxDecoration(
        color: CustomColor.white.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        children: [

          SizedBox(height: Dimensions.heightSize),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.3),
            child: Text(
              Strings.recentTransactions,
              style: CustomStyle.blackTextStyle.copyWith(
                fontSize: Dimensions.defaultTextSize * 2
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          _transactions(context)
        ],
      ),
    );
  }

  _transactions(BuildContext context){
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.widthSize,
      ),
      separatorBuilder: (_, index){
        return SizedBox(
          height: Dimensions.heightSize*0.5,
        );
      },

      itemBuilder: (_, index){
        return TransactionListTileWidget(
          title: 'Payment',
          subTitle: '#TN-20236598',
          date: '29 Sep 2022',
          balance: '100.00 USD',
          decoration: CustomStyle.listTileStyleHome,
        );
      },

      itemCount: 15,
    );
  }

}
