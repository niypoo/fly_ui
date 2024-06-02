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
    this.padding,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  factory FlyIconButton.primary({
    IconData? icon,
    Function? onPressed,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.primaryColor,
        bgColor: Get.theme.primaryColor,
        colorIcon: Get.theme.secondaryHeaderColor,
        icon: icon,
        onPressed: onPressed,
      );
  factory FlyIconButton.card({
    IconData? icon,
    Function? onPressed,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.cardColor,
        bgColor: Get.theme.cardColor,
        icon: icon,
        onPressed: onPressed,
      );
  factory FlyIconButton.scaffold({
    IconData? icon,
    Function? onPressed,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.scaffoldBackgroundColor,
        bgColor: Get.theme.scaffoldBackgroundColor,
        icon: icon,
        onPressed: onPressed,
      );
  factory FlyIconButton.secondary({
    IconData? icon,
    Function? onPressed,
  }) =>
      FlyIconButton(
        borderColor: Get.theme.colorScheme.secondary,
        bgColor: Get.theme.colorScheme.secondary,
        colorIcon: Get.theme.secondaryHeaderColor,
        icon: icon,
        onPressed: onPressed,
      );

  final Color? bgColor;
  final Color? colorIcon;
  final Color? borderColor;
  final IconData? icon;
  final Function? onPressed;
  final EdgeInsets? padding;
  final double? iconSize;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return
        // FlyAnimatedRandomFade(
        //   child:
        Container(
      width: 27.sp,
      height: 27.sp,
      // duration: AppConfigService.to.duration,
      // curve: AppConfigService.to.curve,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        shape: shape,
        color: onPressed == null
            ? Get.theme.cardColor
            : bgColor ?? Get.theme.cardColor,
        border: onPressed == null
            ? null
            : borderColor != null
                ? Border.all(color: borderColor!)
                : null,
      ),
      child: IconButton(
        constraints: const BoxConstraints(),
        padding: padding,
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
      // ),
    );
  }
}
