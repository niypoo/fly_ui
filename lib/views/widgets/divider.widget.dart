import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyDivider extends StatelessWidget {
  const FlyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 15.sp,
      thickness: 1,
      color: Get.iconColor!.withOpacity(0.1),
      indent: 10.sp,
      endIndent: 10.sp,
    );
  }
}
