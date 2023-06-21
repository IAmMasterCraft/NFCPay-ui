import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_pay/helpers/local_storage.dart';
import 'package:nfc_pay/utils/dimensions.dart';
import '../../controller/onboard_controller.dart';
import '../../data/onboard_data.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/strings.dart';
import '../../widgets/short_view_widgets/title_subtitle.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({Key? key}) : super(key: key);

  final _controller = Get.put(OnBoardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    _controller.selectedIndex.value == 1
                        ? Assets.onboardBg2
                        : Assets.onboardBg1,
                  ),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                _skipAndDotDot(),
                _pageViewWidget(),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Stack(
                      children: [
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 73,
                          child: InkWell(
                            onTap: () {
                             _controller.gotoPageChange();
                            },
                            child: CircleAvatar(
                              radius: 41,
                              backgroundColor:
                                  _controller.selectedIndex.value == 1
                                      ? CustomColor.onboardButtonColor2
                                      : CustomColor.onboardButtonColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.defaultPaddingSize),
                          child: TitleSubTitle(
                            titleScale: 3.2,
                            subTitleScale: 1.8,
                            title: onboardData[_controller.selectedIndex.value]
                                .title,
                            subTitle:
                                onboardData[_controller.selectedIndex.value]
                                    .subTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pageViewWidget() {
    return Expanded(
      flex: 2,
      child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _controller.pageController,
          onPageChanged: _controller.selectedIndex,
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: Dimensions.marginSize * 3),
              alignment: Alignment.topCenter,
              // height: MediaQuery.of(context).size.height * 0.10,
              child: Image.asset(
                onboardData[index].image,
                scale: 2,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.45,
              ),
            );
          }),
    );
  }

  _skipAndDotDot() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 2.2),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              LocalStorage.saveOnboardDoneOrNot(isOnBoardDone: true);

              _controller.pageNavigate();
            },
            borderRadius: BorderRadius.circular(Dimensions.radius * 1.3),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.widthSize * 1.5,
                  vertical: Dimensions.heightSize * 0.25),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(Dimensions.radius * 1.3)),
              child: const Text(Strings.skip),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: Dimensions.heightSize * 0.6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _controller.selectedIndex.value == index
                          ? Dimensions.widthSize * 3
                          : Dimensions.widthSize * 2,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 1.3),
                        color: _controller.selectedIndex.value == index
                            ? CustomColor.secondaryColor
                            : CustomColor.black.withOpacity(0.15),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
