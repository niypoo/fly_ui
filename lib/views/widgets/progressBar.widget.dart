import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyProgressBar extends StatelessWidget {
  const FlyProgressBar({
    Key? key,
    this.percentage,
    this.height = 12,
    this.color,
    this.lightMode = true,
    this.linearGradient,
    this.isRTL = false,
  }) : super(key: key);

  final double? percentage;
  final double height;
  final Color? color;
  final bool isRTL;
  final bool lightMode;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    final TextDirection direction =
        isRTL ? TextDirection.rtl : TextDirection.ltr;

    return LayoutBuilder(
      builder: (context, constrain) {
        final double width = constrain.maxWidth;
        final Color effectColor = lightMode ? Colors.black12 : Colors.white12;
        final double effectHeight = height.sp * 0.3;
        final double effectPosition = height.sp * 0.2;
        final double progressFull = width * percentage!;

        return Stack(
          children: [
            FlyProgressContainer(
              color: Get.theme.cardColor,
              height: height.sp,
              width: width,
            ),

            // effect
            Positioned.directional(
              textDirection: direction,
              end: 10,
              bottom: effectPosition,
              child: FlyProgressContainer(
                color: effectColor,
                height: effectHeight,
                width: 2.sp,
              ),
            ),
            // // effect
            Positioned.directional(
              textDirection: direction,
              end: 18,
              bottom: effectPosition,
              child: FlyProgressContainer(
                color: effectColor,
                height: effectHeight,
                width: 4.sp,
              ),
            ),

            // // effect
            Positioned.directional(
              textDirection: direction,
              end: 36,
              bottom: effectPosition,
              child: FlyProgressContainer(
                color: effectColor,
                height: effectHeight,
                width: 7.sp,
              ),
            ),

            // progress
            if (percentage! > 0.1)
              FlyProgressContainer(
                linearGradient: linearGradient,
                color: color ?? Get.theme.primaryColor,
                height: height.sp,
                width: percentage! <= 0 ? 0 : progressFull,
              ),

            // effect
            if (percentage! > 0.1)
              Positioned.directional(
                textDirection: direction,
                start: 10,
                top: effectPosition,
                child: FlyProgressContainer(
                  color: effectColor,
                  height: effectHeight,
                  width: percentage! <= 0 ? 0 : 2.sp,
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
        padding: padding ?? EdgeInsets.all(AppConfigService.to.space!.m),
        margin: margin ??
            EdgeInsets.symmetric(vertical: AppConfigService.to.space!.s),
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
