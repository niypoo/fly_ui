import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:get/get.dart';

class FlyCircleButton extends StatelessWidget {
  const FlyCircleButton({
    Key? key,
    this.icon,
    this.color,
    this.borderColor,
    this.colorIcon,
    this.onPressed,
    this.iconSize,
    this.padding,
  }) : super(key: key);

  factory FlyCircleButton.primary({
    IconData? icon,
    Function? onPressed,
  }) =>
      FlyCircleButton(
        borderColor: Get.theme.primaryColor,
        color: Get.theme.primaryColor,
        colorIcon: Get.theme.secondaryHeaderColor,
        icon: icon,
        onPressed: onPressed,
      );

  final Color? color;
  final Color? colorIcon;
  final Color? borderColor;
  final IconData? icon;
  final Function? onPressed;
  final EdgeInsets? padding;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: AnimatedContainer(
        duration: AppConfigService.to.duration,
        curve: AppConfigService.to.curve,
        decoration: BoxDecoration(
          color: onPressed == null
              ? Get.theme.cardColor
              : color ?? Get.theme.cardColor,
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
          color: Colors.white,
          disabledColor: Colors.white60,
          icon: Icon(
            icon,
            size: iconSize,
            color: onPressed == null
                ? Get.theme.iconTheme.color!.withOpacity(0.2)
                : colorIcon ?? Get.theme.iconTheme.color,
          ),
        ),
      ),
    );
  }
}
