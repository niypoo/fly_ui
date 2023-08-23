import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyFlashMessageContainer extends StatelessWidget {
  const FlyFlashMessageContainer({
    Key? key,
    required this.title,
    required this.child,
    this.icon,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final String child;

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
              if (icon != null) Icon(icon),
              Expanded(
                child: AutoSizeText(
                  title,
                  style: Get.textTheme.labelLarge!.copyWith(
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),

          AutoSizeText(child)
        ],
      ),
    );
  }
}
