import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyFlashMessage extends StatelessWidget {
  const FlyFlashMessage({
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
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(
          color: color.withOpacity(0.4),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppConfigService.to.space!.s,
        horizontal: AppConfigService.to.space!.xs,
      ),
      margin: EdgeInsets.only(top: AppConfigService.to.space!.s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: color),
            ),
          Expanded(
            child: AutoSizeText(
              text,
              style: Get.textTheme.bodyMedium!.copyWith(
                color: color,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
