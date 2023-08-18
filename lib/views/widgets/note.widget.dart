import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
        Row(),

        if (image != null)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConfigService.to.space!.m,
            ),
            child: image,
          ),
        AutoSizeText.rich(
          TextSpan(
            text: title,
            children: [
              const TextSpan(text: ', '),
              TextSpan(
                text: note,
                style: Get.textTheme.bodyMedium,
              )
            ],
          ),
          style: Get.textTheme.bodyLarge,
        ),
        if (button != null) button!
      ],
    );
  }
}
