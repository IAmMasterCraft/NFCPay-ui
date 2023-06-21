import 'package:flutter/material.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/list_tile/notification_title.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration: CustomStyle.bgDecoration2,
          child: Scaffold(
               backgroundColor: CustomColor.white.withOpacity(0.7),
            appBar: AppBarWidget(
              appTitle: Strings.history,
            ),
            body: _bodyWidget(context),
          ),
        )
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.widthSize,
        vertical: Dimensions.heightSize
      ),
      separatorBuilder: (_, index){
        return SizedBox(
          height: Dimensions.heightSize,
        );
      },

      itemBuilder: (_, index){
        return const NotificationListTileWidget(
          title: 'Payment',
          subTitle: '#TN-20236598',
          date: '29 Sep 2022',
          balance: '100.00 USD',
        );
      },

      itemCount: 15,
    );
  }
}
