import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';

class FlyHintText extends StatelessWidget {
  const FlyHintText({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: AutoSizeText(
        hint,
        style: Get.textTheme.labelMedium,
      ),
    );
  }
}
