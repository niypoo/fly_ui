import 'package:flutter/widgets.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyContainerOutline extends StatelessWidget {
  const FlyContainerOutline({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.margin,
  });

  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.symmetric(vertical: 4.sp),
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: 4.sp,
            horizontal: 8.sp,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(color: color ?? Get.theme.cardColor),
      ),
      child: child,
    );
  }
}
