import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';

class FlyLandscapeDivider extends StatelessWidget {
  const FlyLandscapeDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 8.sp,
        height: 70.h,
        child: VerticalDivider(
          color: Get.theme.cardColor,
          thickness: 1,
        ),
      ),
    );
  }
}
