import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyTextCircleButton extends StatelessWidget {
  const FlyTextCircleButton({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.onPressed,
    this.padding,
  });

  factory FlyTextCircleButton.primary({
    required Widget child,
    Function? onPressed,
  }) =>
      FlyTextCircleButton(
        borderColor: Get.theme.primaryColor,
        color: Get.theme.primaryColor,
        onPressed: onPressed,
        child: child,
      );

  final Color? color;
  final Color? borderColor;
  final Widget child;
  final Function? onPressed;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: AppConfigService.to.duration,
      // curve: AppConfigService.to.curve,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: onPressed == null
            ? Get.theme.cardColor
            : color ?? Get.theme.cardColor,
        border: onPressed == null
            ? null
            : borderColor != null
                ? Border.all(color: borderColor!)
                : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
        ),
        onPressed: onPressed as void Function()?,
        child: child,
      ),
    );
  }
}
