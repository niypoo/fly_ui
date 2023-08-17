import 'package:app_config/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyElevatedFlexibleButton extends StatelessWidget {
  const FlyElevatedFlexibleButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.color,
    this.textColor,
    this.margin,
  }) : super(key: key);

  factory FlyElevatedFlexibleButton.normal({
    required String title,
    required Function onPressed,
  }) =>
      FlyElevatedFlexibleButton(
        color: Get.theme.cardColor,
        title: title,
        onPressed: onPressed,
      );

  factory FlyElevatedFlexibleButton.close({
    required String title,
    required Function onPressed,
  }) =>
      FlyElevatedFlexibleButton(
        color: Get.theme.cardColor,
        title: title,
        onPressed: onPressed,
      );

  factory FlyElevatedFlexibleButton.primary({
    required String title,
    required Function onPressed,
  }) =>
      FlyElevatedFlexibleButton(
        color: Get.theme.primaryColor,
        textColor: Get.theme.secondaryHeaderColor,
        title: title,
        onPressed: onPressed,
      );

  final String title;
  final Function? onPressed;
  final Color? color;
  final Color? textColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Get.theme.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConfigService.to.radius),
        ),
      ),
      child: Text(
        title,
        style: Get.textTheme.labelLarge!.copyWith(
          color: textColor ?? Get.textTheme.bodyLarge!.color,
        ),
      ),
    );
  }
}
