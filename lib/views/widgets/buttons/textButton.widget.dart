import 'package:flutter/material.dart';
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
        style: Get.textTheme.labelLarge!.copyWith(
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }
}
