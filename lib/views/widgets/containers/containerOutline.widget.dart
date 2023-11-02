import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyContainerOutline extends StatelessWidget {
  const FlyContainerOutline({
    Key? key,
    required this.child,
    this.color,
    this.padding,
    this.margin,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(vertical: AppConfigService.to.space!.xxs),
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: AppConfigService.to.space!.s,
            horizontal: AppConfigService.to.space!.m,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(color: color ?? Get.theme.cardColor),
      ),
      child: child,
    );
  }
}
