import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/services/color.service.dart';
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
                style: Get.textTheme.titleLarge!.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),

          if (enableDivider)
            Divider(
              color: textColor != null
                  ? ColorService.colorLight(textColor!)
                  : ColorService.primaryLight(),
              height: AppConfigService.to.space!.l,
            )
          else
            SizedBox(height: AppConfigService.to.space!.m),

          child,
        ],
      ),
    );
  }
}
