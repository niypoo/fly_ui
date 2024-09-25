import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyTextButton extends StatelessWidget {
  const FlyTextButton({
    Key? key,
    required this.title,
    this.onTap,
    this.onLongPress,
    this.style,
    this.color,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final Function()? onLongPress;
  final Color? color;
  final TextStyle? style;

  factory FlyTextButton.primary({
    required String title,
    Function()? onTap,
    Function()? onLongPress,
  }) =>
      FlyTextButton(
        title: title,
        onTap: onTap,
        onLongPress: onLongPress,
        color: Get.theme.primaryColor,
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      onPressed: onTap,
      child: Text(
        title,
        style: Get.textTheme.titleMedium!.copyWith(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
