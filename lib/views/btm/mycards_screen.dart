import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/btm/mycards_controller.dart';
import '../../routes/routes.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/list_tile/card_list_widget.dart';

class MyCardsScreen extends StatelessWidget {
  MyCardsScreen({Key? key}) : super(key: key);
  final controller = Get.put(MyCardsController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index){
              return InkWell(
                onTap: (){
                  Get.toNamed(Routes.updateCardScreen);
                },
                child: CardListWidget(
                  cardCvc: '123',
                  index: index,
                  cardName: 'Amandon Bril',
                  cardNo: '3646 5564 0034 0891',
                  expiryDate: '09/24',
                ),
              );
            },
            separatorBuilder: (_, index){
              return SizedBox(
                height: Dimensions.heightSize * 0,
              );
            },
            itemCount: 3
        ),

        SizedBox(
          height: Dimensions.heightSize * 1.5,
        ),

        InkWell(
          onTap: (){
            Get.toNamed(Routes.addNewCardScreen);
          },
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.widthSize * 2
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius *1.5),
              color: CustomColor.white.withOpacity(0.23)
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: CustomColor.secondaryColor,
                  radius: Dimensions.radius * 2.7,
                  child: const Icon(Icons.add, color: Colors.white,),
                ),

                SizedBox(
                  height: Dimensions.heightSize * 0.5,
                ),

                Text(
                    Strings.addCard,
                  style: CustomStyle.secondaryTextStyle.copyWith(
                    fontSize: Dimensions.defaultTextSize * 1.4
                  ),
                )
              ],
            ),
          ),
        ),

        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
      ],
    );
  }
}
