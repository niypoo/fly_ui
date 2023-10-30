import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:get/get.dart';

class FlyElevatedIconButton extends StatelessWidget {
  const FlyElevatedIconButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.margin,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  factory FlyElevatedIconButton.primary({
    IconData? icon,
    String? title,
    Function? onPressed,
  }) =>
      FlyElevatedIconButton(
        bgColor: Get.theme.primaryColor,
        textColor: Get.theme.secondaryHeaderColor,
        icon: icon,
        title: title,
        onPressed: onPressed,
      );

  factory FlyElevatedIconButton.normal({
    IconData? icon,
    String? title,
    Function? onPressed,
  }) =>
      FlyElevatedIconButton(
        bgColor: Get.theme.cardColor,
        textColor: Get.textTheme.bodyLarge!.color,
        icon: icon,
        title: title,
        onPressed: onPressed,
      );

  factory FlyElevatedIconButton.text({
    IconData? icon,
    String? title,
    Function? onPressed,
  }) =>
      FlyElevatedIconButton(
        bgColor: Get.theme.scaffoldBackgroundColor,
        textColor: Get.textTheme.bodyLarge!.color,
        icon: icon,
        title: title,
        onPressed: onPressed,
      );

  final String? title;
  final Function? onPressed;
  final Color? bgColor;
  final Color? textColor;
  final IconData? icon;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: Container(
        width: Get.width,
        margin: margin ??
            EdgeInsets.symmetric(
              vertical: AppConfigService.to.space!.s,
            ),
        child: ElevatedButton.icon(
          onPressed: onPressed as void Function()?,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? Get.theme.cardColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConfigService.to.radius,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppConfigService.to.space!.s,
            ),
          ),
          label: Text(
            title!,
            style: Get.textTheme.titleMedium!.copyWith(
              color: textColor,
              fontSize: 13.sp,
            ),
          ),
          icon: Icon(
            icon,
            color: textColor,
            size: 14.sp,
          ),
        ),
      ),
    );
  }
}
