import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:get/get.dart';

class FlyOutlineButton extends StatelessWidget {
  const FlyOutlineButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.color,
  }) : super(key: key);

  factory FlyOutlineButton.secondary(
          {String? title, Function? onPressed, EdgeInsets? margin}) =>
      FlyOutlineButton(
        color: Get.theme.colorScheme.secondary,
        title: title,
        onPressed: onPressed,
      );

  factory FlyOutlineButton.primary(
          {String? title, Function? onPressed, EdgeInsets? margin}) =>
      FlyOutlineButton(
        color: Get.theme.primaryColor,
        title: title,
        onPressed: onPressed,
      );

  final String? title;
  final Function? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: OutlinedButton(
        onPressed: onPressed as void Function()?,
        style: OutlinedButton.styleFrom(
          foregroundColor: Get.theme.primaryColor,
          side: color != null ? BorderSide(color: color!) : null,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
        ),
        child: Text(
          title!,
          style: Get.textTheme.titleMedium!.copyWith(
            color: color,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
