import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
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
    return OutlinedButton(
        onPressed: onPressed as void Function()?,
        style: OutlinedButton.styleFrom(
          foregroundColor: color != null
              ? color!.withOpacity(0.3)
              : Get.theme.primaryColor.withOpacity(0.3),
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
            fontSize: 11.sp,
          ),
        ),
    );
  }
}
