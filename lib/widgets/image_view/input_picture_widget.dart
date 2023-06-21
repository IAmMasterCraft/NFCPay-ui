import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/input_image_controller.dart';
import '../../../utils/custom_color.dart';
import '../../controller/drawer_screen/update_profile_controller.dart';
import '../../utils/assets.dart';
import '../../utils/dimensions.dart';
import 'image_widget.dart';

// ignore: must_be_immutable
class InputImageWidget extends StatelessWidget {
  final String networkImage;

  InputImageWidget({Key? key, this.networkImage = ''}) : super(key: key);

  final controller = Get.put(InputImageController());
  final profileController = Get.put(UpdateProfileController());

  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(
          borderColor: CustomColor.primaryColor,
        ),
        Positioned(
          bottom: 1,
          right: 1,
          top: 1,
          left: 1,
          child: InkWell(
            onTap: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (ctx, a1, a2) {
                  return Container();
                },
                transitionBuilder: (ctx, a1, a2, child) {
                  var curve = Curves.easeInOut.transform(a1.value);
                  return Transform.scale(
                    scale: curve,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 2),
                      ),
                      content: _bottomSheet(context),
                    ),
                  );
                },
                transitionDuration: const Duration(milliseconds: 400),
              );
            },
            child: Container(
                padding: const EdgeInsets.all(55),
                decoration: BoxDecoration(
                    color: CustomColor.secondaryColor.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 10)),
                child: SvgPicture.asset(Assets.camera)),
          ),
        )
      ],
    );
  }

  _bottomSheet(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 260,
      height: 100,
      decoration: BoxDecoration(
        color: CustomColor.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
              top: -15,
              right: -15,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.defaultPaddingSize*0.7),
                  child: IconButton(
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.image,
                        color: CustomColor.primaryColor,
                        size: 50,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.defaultPaddingSize),
                  child: IconButton(
                      onPressed: () {
                        takePhoto(ImageSource.camera);
                         Get.back();
                      },
                      icon: const Icon(
                        Icons.camera,
                        color: CustomColor.primaryColor,
                        size: 50,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    controller.setImagePath(pickedFile!.path);
  }
}
