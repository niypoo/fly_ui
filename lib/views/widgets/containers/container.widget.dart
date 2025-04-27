import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyContainer extends StatelessWidget {
  const FlyContainer({
    Key? key,
    required this.child,
    this.color,
    this.padding,
    this.border,
    this.radius,
    this.margin,
    this.outline = false,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final Color? border;
  final bool outline;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 6.sp),
      padding: padding ?? EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 15.sp),
        color: color ?? Get.theme.cardColor,
        border: Border.all(
          color: border ?? Get.theme.cardColor,
          width: 2.0,
        ),
      ),
      child: child,
    );
  }
}
