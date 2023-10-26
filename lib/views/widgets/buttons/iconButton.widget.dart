import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:get/get.dart';

class FlyIconButton extends StatelessWidget {
  const FlyIconButton({
    Key? key,
    this.icon,
    this.bgColor,
    this.borderColor,
    this.colorIcon,
    this.onPressed,
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

  final Color? bgColor;
  final Color? colorIcon;
  final Color? borderColor;
  final IconData? icon;
  final Function? onPressed;
  final EdgeInsets? padding;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: AnimatedContainer(
        width: 6.w,
        height: 6.w,
        duration: AppConfigService.to.duration,
        curve: AppConfigService.to.curve,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConfigService.to.radius),
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
          // constraints: const BoxConstraints(),
          padding: padding,
          onPressed: onPressed as void Function()?,
          color: Colors.white,
          disabledColor: Colors.white60,
          icon: Icon(
            icon,
            size: 20.sp,
            color: onPressed == null
                ? Get.theme.iconTheme.color!.withOpacity(0.2)
                : colorIcon ?? Get.theme.iconTheme.color,
          ),
        ),
      ),
    );
  }
}
