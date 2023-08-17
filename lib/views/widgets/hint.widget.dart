import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyHintText extends StatelessWidget {
  const FlyHintText({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConfigService.to.space!.m),
      child: AutoSizeText(
        hint,
        style: Get.textTheme.bodyMedium,
      ),
    );
  }
}
