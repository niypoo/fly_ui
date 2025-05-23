import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:localization_service/localization.service.dart';

class FlyProgressBar extends StatelessWidget {
  const FlyProgressBar({
    Key? key,
    this.percentage,
    this.height = 12,
    this.color,
    this.bgColor,
    this.lightMode = true,
    this.linearGradient,
  }) : super(key: key);

  final double? percentage;
  final double height;
  final Color? color;
  final Color? bgColor;

  final bool lightMode;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        final bool isRTL = !LocalizationService.to.isRTL;
        final double width = constrain.maxWidth;
        final Color effectColor = lightMode ? Colors.black12 : Colors.white12;
        final double effectHeight = height.sp * 0.3;
        final double effectPosition = height.sp * 0.2;
        final double progressFull = width * percentage!;

        return Stack(
          children: [
            FlyProgressContainer(
              color: bgColor ?? Get.theme.cardColor,
              height: height.sp,
              width: width,
            ),

            // effect
            Positioned(
              left: isRTL ? null : 10,
              right: isRTL ? 10 : null,
              bottom: effectPosition,
              child: FlyProgressContainer(
                color: effectColor,
                height: effectHeight,
                width: 5,
              ),
            ),
            // // effect
            Positioned(
              left: isRTL ? null : 18,
              right: isRTL ? 18 : null,
              bottom: effectPosition,
              child: FlyProgressContainer(
                color: effectColor,
                height: effectHeight,
                width: 15,
              ),
            ),

            // // effect
            Positioned(
              left: isRTL ? null : 36,
              right: isRTL ? 36 : null,
              bottom: effectPosition,
              child: FlyProgressContainer(
                color: effectColor,
                height: effectHeight,
                width: 15,
              ),
            ),

            // progress
            // if (percentage! > 0.1)
            FlyProgressContainer(
              linearGradient: linearGradient,
              color: color ?? Get.theme.primaryColor,
              height: height.sp,
              width: progressFull,
            ),

            // effect
            if (progressFull > 25)
              Positioned(
                left: isRTL ? 10 : null,
                right: isRTL ? null : 10,
                top: effectPosition,
                child: FlyProgressContainer(
                  color: Colors.white30,
                  height: effectHeight,
                  width: 15,
                ),
              ),

            // effect
            if (progressFull > 38)
              Positioned(
                left: isRTL ? 30 : null,
                right: isRTL ? null : 30,
                top: effectPosition,
                child: FlyProgressContainer(
                  color: Colors.white30,
                  height: effectHeight,
                  width: 8,
                ),
              ),
          ],
        );
      },
    );
  }
}

class FlyProgressContainer extends StatelessWidget {
  const FlyProgressContainer({
    this.child,
    this.onTap,
    this.color,
    this.height,
    this.width,
    this.disabled = false,
    this.circle = false,
    this.linearGradient,
    this.margin,
    this.padding,
    key,
  }) : super(key: key);

  final Widget? child;
  final Function? onTap;
  final Color? color;
  final double? height;
  final double? width;
  final bool disabled;
  final bool circle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.sp),
      onTap: onTap as void Function()?,
      child: AnimatedContainer(
        padding: padding ?? EdgeInsets.all(5.sp),
        margin: margin ??
            EdgeInsets.symmetric(vertical: 8.sp),
        height: height,
        width: width,
        duration: AppConfigService.to.duration,
        curve: AppConfigService.to.curve,
        decoration: BoxDecoration(
          shape: circle ? BoxShape.circle : BoxShape.rectangle,
          gradient: linearGradient,
          borderRadius: circle ? null : BorderRadius.circular(15.sp),
          color: disabled ? Colors.grey[300] : color ?? Get.theme.cardColor,
        ),
        child: child,
      ),
    );
  }
}
