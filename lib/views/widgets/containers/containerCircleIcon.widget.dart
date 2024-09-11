import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyContainerCircleIcon extends StatelessWidget {
  const FlyContainerCircleIcon({
    Key? key,
    this.icon,
    this.bgColor,
    this.colorIcon,
    this.iconSize,
  }) : super(key: key);

  final Color? bgColor;
  final Color? colorIcon;
  final IconData? icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.sp,
      height: 30.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor ?? Get.theme.cardColor,
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize ?? 18.sp,
          color: colorIcon ?? Get.theme.iconTheme.color,
        ),
      ),
    );
  }
}
