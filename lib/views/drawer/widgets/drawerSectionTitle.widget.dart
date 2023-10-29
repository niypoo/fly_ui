import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: FlyTitle(
        text: title,
        textStyle: Get.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
