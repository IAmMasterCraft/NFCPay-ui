import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/input_image_controller.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../api/custom_snackbar.dart';

File? imageFile;

class ImageWidget extends StatelessWidget {
  final Color borderColor;
  ImageWidget({Key? key, this.borderColor = CustomColor.borderColor})
      : super(key: key);
  final imgController = Get.put(InputImageController());
  // image picker function
  Future pickImage(imageSource) async {
    try {
      final image = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 40, // define image quality
        maxHeight: 600, // image height
        maxWidth: 600, // image width
      );
      if (image == null) return;

      imageFile = File(image.path);
      imgController.setImagePath(imageFile!.path);
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Dimensions.radius * 10),
          border: Border.all(
            color: borderColor,
            width: 5,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.3),
          radius: 60,
          backgroundImage: imgController.isImagePathSet.value == true
              ? FileImage(
                  File(
                    imgController.imagePath.value,
                  ),
                )
              : const AssetImage(Assets.profile) as ImageProvider,
        ),
      ),
    );
  }
}
