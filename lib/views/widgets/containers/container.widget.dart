import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyContainer extends StatelessWidget {
  const FlyContainer({
    Key? key,
    required this.child,
    this.color,
    this.padding,
    this.border,
    this.radius,
    this.margin,
    this.outline = false,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final Color? border;
  final bool outline;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(vertical: AppConfigService.to.space!.xs),
      padding: padding ?? EdgeInsets.all(AppConfigService.to.space!.m),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius ?? AppConfigService.to.radius,
        ),
        color: color ?? Get.theme.cardColor,
        border: outline
            ? Border.all(
                color: border ?? Get.theme.iconTheme.color!.withOpacity(0.2),
              )
            : null,
      ),
      child: child,
    );
  }
}
