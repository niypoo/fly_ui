import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyIconButton extends StatelessWidget {
  const FlyIconButton({
    Key? key,
    this.icon,
    this.bgColor,
    this.borderColor,
    this.colorIcon,
    this.onPressed,
    this.iconSize,
    this.size = 30,
    this.borderWidth = 1,
    this.padding,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  factory FlyIconButton.primary({
    IconData? icon,
    Function? onPressed,
    double? size,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.primaryColor,
        bgColor: Get.theme.primaryColor,
        colorIcon: Get.theme.secondaryHeaderColor,
        icon: icon,
        size: size,
        onPressed: onPressed,
      );
  factory FlyIconButton.card({
    IconData? icon,
    Function? onPressed,
    double? size,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.cardColor,
        bgColor: Get.theme.cardColor,
        icon: icon,
        size: size,
        onPressed: onPressed,
      );
  factory FlyIconButton.scaffold({
    IconData? icon,
    Function? onPressed,
    double? size,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.scaffoldBackgroundColor,
        bgColor: Get.theme.scaffoldBackgroundColor,
        icon: icon,
        size: size,
        onPressed: onPressed,
      );
  factory FlyIconButton.secondary({
    IconData? icon,
    Function? onPressed,
    double? size,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.colorScheme.secondary,
        bgColor: Get.theme.colorScheme.secondary,
        colorIcon: Get.theme.secondaryHeaderColor,
        icon: icon,
        size: size,
        onPressed: onPressed,
      );

  final Color? bgColor;
  final Color? colorIcon;
  final Color? borderColor;
  final IconData? icon;
  final Function? onPressed;
  final EdgeInsets? padding;
  final double? iconSize;
  final double? size;
  final double borderWidth;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: size!.sp,
      height: size!.sp,
      decoration: BoxDecoration(
        borderRadius:
            shape == BoxShape.circle ? null : BorderRadius.circular(15.sp),
        shape: shape,
        color: onPressed == null
            ? Get.theme.cardColor
            : bgColor ?? Get.theme.cardColor,
        border: onPressed == null
            ? null
            : borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth)
                : null,
      ),
      child: IconButton(
        constraints:
            const BoxConstraints(), // override default min size of 48px
        style: const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
        ),
        padding: padding ?? EdgeInsets.zero,
        onPressed: onPressed as void Function()?,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        color: Colors.white,
        disabledColor: Colors.white60,
        icon: Icon(
          icon,
          size: iconSize ?? 16.sp,
          color: onPressed == null
              ? Get.theme.iconTheme.color!.withOpacity(0.2)
              : colorIcon ?? Get.theme.iconTheme.color,
        ),
      ),
    );
  }
}
