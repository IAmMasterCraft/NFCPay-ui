import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/local_storage.dart';
import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/list_tile/drawer_list_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius * 2),
        )),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffC7C8FF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius * 2),
            ),
            // image: DecorationImage(
            //   image: AssetImage(Assets.drawerBG),
            //   fit: BoxFit.fill
            // )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _header(context),
                SizedBox(height: Dimensions.heightSize * 2),
                _tiles(context),
                SizedBox(height: Dimensions.heightSize * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius * 2),
              ),
              color: CustomColor.secondaryColor,
              image: const DecorationImage(
                  image: AssetImage(Assets.drawerBG), fit: BoxFit.fitWidth)),
        ),
        Container(
          margin: EdgeInsets.only(top: Dimensions.heightSize * 3),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Dimensions.heightSize * 2),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(Dimensions.radius * 10),
                  border: Border.all(
                    color: CustomColor.borderColor,
                    width: 5,
                  ),
                ),
                child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.3),
                    radius: 60,
                    backgroundImage: const AssetImage(Assets.profile)),
              ),
              SizedBox(height: Dimensions.heightSize * 1),
              Text(
                'Adhiana Prolo',
                style: CustomStyle.primaryTextStyle.copyWith(
                  fontSize: Dimensions.defaultTextSize * 2.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'adhiana@gmail.com',
                style: CustomStyle.primaryTextStyle.copyWith(
                  fontSize: Dimensions.defaultTextSize * 1.8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _tiles(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        DrawerListWidget(
          text: Strings.updateProfile,
          assetName: Assets.updateProfile,
          onTab: () {
            Get.toNamed(Routes.updateProfileScreen);
          },
        ),
        DrawerListWidget(
          text: Strings.changePassword,
          assetName: Assets.changePassword,
          onTab: () {
            Get.toNamed(Routes.changePasswordScreen);
          },
        ),
        DrawerListWidget(
          text: Strings.history,
          assetName: Assets.history,
          onTab: () {
            Get.toNamed(Routes.historyScreen);
          },
        ),
        DrawerListWidget(
          text: Strings.aboutUs,
          assetName: Assets.aboutUS,
          onTab: () {},
        ),
        DrawerListWidget(
          text: Strings.helpCenter,
          assetName: Assets.helpCenter,
          onTab: () {},
        ),
        DrawerListWidget(
          text: Strings.privacyPolicy,
          assetName: Assets.privacyPoloicy,
          onTab: () {},
        ),
        DrawerListWidget(
          text: Strings.signOut,
          assetName: Assets.signOut,
          onTab: () {
            LocalStorage.logout();
            Get.offAndToNamed(Routes.signInScreen);
          },
        ),
      ],
    );
  }
}
