import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/titleHeadline.widget.dart';
import 'package:get/get.dart';

class FlyDrawerSectionTitle extends StatelessWidget {
  final String title;

  const FlyDrawerSectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(
        start: 0,
        top: 20.sp,
        bottom: 5.sp,
      ),
      child: FlyTitle(
        text: title,
        textStyle: Get.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
