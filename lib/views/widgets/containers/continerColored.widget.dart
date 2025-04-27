import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

// TODO: merge containers in less is the best
class FlyContainerColored extends StatelessWidget {
  const FlyContainerColored({
    Key? key,
    required this.child,
    this.color,
    this.colorBorder,
    this.width,
    this.height,
    this.padding,
    this.margin,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final Color? colorBorder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConfigService.to.duration,
      curve: AppConfigService.to.curve,
      margin: margin ?? EdgeInsets.all(2.sp),
      padding: padding ?? EdgeInsets.all(10.sp),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
            color: colorBorder ?? Get.theme.iconTheme.color!.withOpacity(0.2)),
        color: color ?? Get.theme.cardColor,
      ),
      child: child,
    );
  }
}
