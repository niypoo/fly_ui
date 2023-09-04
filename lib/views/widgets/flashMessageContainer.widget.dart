import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyFlashMessageContainer extends StatelessWidget {
  const FlyFlashMessageContainer({
    Key? key,
    required this.text,
    required this.color,
    this.icon,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(
          color: color,
        ),
      ),
      padding: EdgeInsets.all(AppConfigService.to.space!.m),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: color),
          Expanded(
            child: AutoSizeText(
              text,
              style: Get.textTheme.labelLarge!.copyWith(
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
