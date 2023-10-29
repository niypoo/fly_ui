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
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final Function()? onLongPress;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: Get.textTheme.titleMedium!.copyWith(
          color: Get.theme.primaryColor,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
