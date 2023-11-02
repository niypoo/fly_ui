import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:get/get.dart';

class FlyElevatedButton extends StatelessWidget {
  const FlyElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.color,
    this.textColor,
    this.margin,
  }) : super(key: key);

  factory FlyElevatedButton.normal({
    String? title,
    Function? onPressed,
    EdgeInsets? margin,
  }) =>
      FlyElevatedButton(
        color: Get.theme.cardColor,
        textColor: Get.textTheme.titleMedium!.color,
        title: title,
        onPressed: onPressed,
        margin: margin,
      );

  factory FlyElevatedButton.close(
          {String? title, Function? onPressed, EdgeInsets? margin}) =>
      FlyElevatedButton(
        color: Get.theme.cardColor,
        textColor: Get.textTheme.titleMedium!.color,
        title: title,
        onPressed: onPressed,
        margin: margin,
      );

  factory FlyElevatedButton.primary(
          {String? title, Function? onPressed, EdgeInsets? margin}) =>
      FlyElevatedButton(
        color: Get.theme.primaryColor,
        textColor: Get.theme.secondaryHeaderColor,
        title: title,
        onPressed: onPressed,
        margin: margin,
      );

  final String? title;
  final Function? onPressed;
  final Color? color;
  final Color? textColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: Container(
        width: context.width,
        margin: margin,
        child: ElevatedButton(
          onPressed: onPressed as void Function()?,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Get.theme.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppConfigService.to.space!.s,
            ),
          ),
          child: Text(
            title!,
            style: Get.textTheme.titleMedium!.copyWith(
              color: textColor,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
