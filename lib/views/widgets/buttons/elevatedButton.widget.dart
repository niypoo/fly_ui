import 'package:auto_size_text/auto_size_text.dart';
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
    this.expand = false,
    this.iconAlignment = IconAlignment.start,
  }) : super(key: key);

  factory FlyElevatedButton.normal({
    required String title,
    Function? onPressed,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.cardColor,
        textColor: Get.textTheme.titleMedium!.color,
        title: title,
        onPressed: onPressed,
        icon: icon,
        iconAlignment: iconAlignment,
        expand: expand,
      );

  factory FlyElevatedButton.close({
    required String title,
    Function? onPressed,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.scaffoldBackgroundColor,
        textColor: Get.textTheme.titleMedium!.color,
        title: title,
        onPressed: onPressed,
        icon: icon,
        iconAlignment: iconAlignment,
        expand: expand,
      );

  factory FlyElevatedButton.primary({
    required String title,
    Function? onPressed,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.primaryColor,
        textColor: Get.theme.secondaryHeaderColor,
        title: title,
        onPressed: onPressed,
        icon: icon,
        iconAlignment: iconAlignment,
        expand: expand,
      );
  factory FlyElevatedButton.secondary({
    required String title,
    Function? onPressed,
    IconData? icon,
    IconAlignment? iconAlignment,
    bool expand = false,
  }) =>
      FlyElevatedButton(
        color: Get.theme.colorScheme.secondary,
        textColor: Get.theme.secondaryHeaderColor,
        title: title,
        onPressed: onPressed,
        iconAlignment: iconAlignment,
        expand: expand,
      );

  final String title;
  final IconData? icon;
  final Function? onPressed;
  final Color? color;
  final Color? textColor;
  final IconAlignment? iconAlignment;
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
        vertical: 8.sp,
        horizontal: 12.sp,
      ),
     disabledBackgroundColor: Colors.grey[50],
     disabledForegroundColor: Colors.grey[50],
     disabledIconColor: Colors.grey[50],
     disabledMouseCursor: MouseCursor.defer
    );

    //STYLES of the title
    final TextStyle titleStyle = Get.textTheme.labelLarge!.copyWith(
      color: textColor,
    );

    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: expand ? constraints.maxWidth : null,
        child: icon != null
            ? ElevatedButton.icon(
                iconAlignment: iconAlignment ?? IconAlignment.end,
                onPressed: onPressed as void Function()?,
                style: buttonStyle,
                label: AutoSizeText(
                  title,
                  style: titleStyle,
                  maxLines: 1,
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
                child: AutoSizeText(
                  title,
                  style: titleStyle,
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}
