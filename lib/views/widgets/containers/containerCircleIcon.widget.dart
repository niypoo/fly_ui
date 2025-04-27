import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyContainerCircleIcon extends StatelessWidget {
  const FlyContainerCircleIcon({
    super.key,
    this.icon,
    this.bgColor,
    this.colorIcon,
    this.iconSize,
    this.size = 30,
  });

  final Color? bgColor;
  final Color? colorIcon;
  final IconData? icon;
  final double? iconSize;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.sp,
      height: size.sp,
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
