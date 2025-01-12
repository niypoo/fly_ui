import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyElevatedButton extends StatelessWidget {
  const FlyElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.icon,
    this.color,
    this.textColor,
    this.margin,
    this.expand = false,
    this.iconAlignment = IconAlignment.start,
  }) : super(key: key);

  factory FlyElevatedButton.normal({
    required String title,
    Function? onPressed,
    IconData? icon,
    EdgeInsetsGeometry? margin,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.cardColor,
        textColor: Get.textTheme.titleMedium!.color,
        title: title,
        onPressed: onPressed,
        margin: margin,
        icon: icon,
        iconAlignment: iconAlignment,
        expand: expand,
      );

  factory FlyElevatedButton.close({
    required String title,
    Function? onPressed,
    EdgeInsetsGeometry? margin,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.scaffoldBackgroundColor,
        textColor: Get.textTheme.titleMedium!.color,
        title: title,
        onPressed: onPressed,
        margin: margin,
        icon: icon,
        iconAlignment: iconAlignment,
        expand: expand,
      );

  factory FlyElevatedButton.primary({
    required String title,
    Function? onPressed,
    EdgeInsetsGeometry? margin,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.primaryColor,
        textColor: Get.theme.secondaryHeaderColor,
        title: title,
        onPressed: onPressed,
        margin: margin,
        icon: icon,
        iconAlignment: iconAlignment,
        expand: expand,
      );
  factory FlyElevatedButton.secondary({
    required String title,
    Function? onPressed,
    EdgeInsetsGeometry? margin,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.colorScheme.secondary,
        textColor: Get.theme.secondaryHeaderColor,
        title: title,
        onPressed: onPressed,
        margin: margin,
        iconAlignment: iconAlignment,
        expand: expand,
      );

  final String title;
  final IconData? icon;
  final Function? onPressed;
  final Color? color;
  final Color? textColor;
  final IconAlignment? iconAlignment;
  final EdgeInsetsGeometry? margin;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    // STYLES OF THE BUTTON
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: color ?? Get.theme.primaryColor,
      elevation: 0,
      foregroundColor: color != null
          ? color!.withOpacity(0.3)
          : Get.theme.primaryColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.sp,
        horizontal: 10.sp,
      ),
    );

    //STYLES of the title
    final TextStyle titleStyle = Get.textTheme.titleMedium!.copyWith(
      color: textColor,
      fontSize: 11.sp,
      fontWeight: FontWeight.bold,
    );

    return Container(
      width: expand ? Get.width : null,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 0, vertical: 5.sp),
      child: icon != null
          ? ElevatedButton.icon(
            iconAlignment: iconAlignment ?? IconAlignment.start,
              onPressed: onPressed as void Function()?,
              style: buttonStyle,
              label: Text(
                title,
                style: titleStyle,
              ),
              icon: Icon(
                icon,
                color: textColor,
                size: 14.sp,
              ),
            )
          : ElevatedButton(
              onPressed: onPressed as void Function()?,
              style: buttonStyle,
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
    );
  }
}
