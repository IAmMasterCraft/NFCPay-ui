import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
 import '../inputs_widgets/primary_input_field.dart';


class CardExpiryDate extends StatefulWidget {
  final TextEditingController controller;
  final bool autofocus;
  const CardExpiryDate({
    Key? key,
    required this.controller,
    this.autofocus = false
  }) : super(key: key);

  @override
  State<CardExpiryDate> createState() => _CardExpiryDateState();
}

class _CardExpiryDateState extends State<CardExpiryDate> {
  @override
  Widget build(BuildContext context) {
    return PrimaryInputField(
      autofocus: widget.autofocus,
      readOnly: true,
      controller: widget.controller,
      hintText: '12/2025',
      keyboardType: TextInputType.text,
      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => _datePickerBottomSheetWidget(context),
        );
      },
      labelText: 'Expiry',
    );
  }

  RxString month = "1".obs;

  RxString year = DateTime.now().year.toString().obs;

  _datePickerBottomSheetWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(Dimensions.marginSize * 0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Month'),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,i){
                  return InkWell(
                      onTap: (){
                        month.value = (i+1).toString();
                      },
                      child: Obx(() => Container(
                        alignment: Alignment.center,
                        color: month.value == (i+1).toString()
                            ? CustomColor.primaryColor
                            : Colors.transparent,
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${i+1}',
                        style: TextStyle(
                            color: month.value == (i+1).toString()
                            ? Colors.white
                            : Colors.black
                        ),
                        ),
                      ))
                  );
                },
                separatorBuilder: (_, i){
                  return const SizedBox(width: 5);
                },
                itemCount: 12
            ),
          ),

          const SizedBox(height: 15),
          const Divider(),

          const Text('Select Year'),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,i){
                  return InkWell(
                      onTap: (){
                        year.value = (DateTime.now().year+i).toString();
                      },
                      child: Obx(() => Container(
                          alignment: Alignment.center,
                          color:  year.value == (DateTime.now().year+i).toString()
                              ? CustomColor.primaryColor
                              : Colors.transparent,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '${DateTime.now().year+i}',
                           style:  TextStyle(
                                color: year.value == (DateTime.now().year+i).toString()
                                    ? Colors.white
                                    : Colors.black
                            ),
                            )
                      ))
                  );
                },
                separatorBuilder: (_, i){
                  return const SizedBox(width: 5);
                },
                itemCount: 10
            ),
          ),

          const SizedBox(
            height: 15
          ),

          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
                onTap: (){
                  widget.controller.text = '${month.value}/${year.value}';
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColor.primaryColor
                  ),
                    child: const Text(
                        'Select',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}
