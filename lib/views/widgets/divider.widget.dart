import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyDivider extends StatelessWidget {
  const FlyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 15.sp,
      thickness: 1,
      color: Get.iconColor!.withOpacity(0.1),
      indent: 5.sp,
      endIndent: 5.sp,
    );
  }
}
