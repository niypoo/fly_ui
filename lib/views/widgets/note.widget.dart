import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyNote extends StatelessWidget {
  const FlyNote({
    Key? key,
    required this.title,
    required this.note,
    this.image,
    this.button,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final String title;
  final String note;
  final Widget? image;
  final Widget? button;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TO Fit
        const Row(),

        if (image != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            child: image,
          ),

        // NOTE
        AutoSizeText.rich(
          TextSpan(
            text: title,
            children: [
              const TextSpan(text: ', '),
              TextSpan(
                text: note,
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' '),
            ],
          ),
          style: Get.textTheme.bodyLarge!.copyWith(fontSize: 10.sp),
        ),

        // BUTTON
        if (button != null) button!
      ],
    );
  }
}
