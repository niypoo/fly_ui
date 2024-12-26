import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyContainerTitled extends StatelessWidget {
  const FlyContainerTitled({
    Key? key,
    required this.title,
    required this.child,
    this.bgColor,
    this.textColor,
    this.enableDivider = false,
  }) : super(key: key);

  final String title;
  final Color? bgColor;
  final Color? textColor;
  final bool enableDivider;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: bgColor ?? Get.theme.cardColor,
      margin: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
      child: Column(
        children: [
          // Title
          Row(
            children: [
              AutoSizeText(
                title,
                style: Get.textTheme.labelLarge!.copyWith(
                  color: textColor,
                 fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          if (enableDivider)
            Divider(
              color: Get.theme.scaffoldBackgroundColor.withOpacity(0.4),
              height: 15.sp,
            ),

          child,
        ],
      ),
    );
  }
}
