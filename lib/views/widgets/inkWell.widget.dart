import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyInkWell extends StatelessWidget {
  const FlyInkWell({
    Key? key,
    required this.child,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Function? onTap;
  final Function? onLongPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Get.theme.primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15.sp),
      onTap: onTap == null ? null : () {
        onTap!();
      },
      onLongPress:onLongPress == null ? null : () {
       onLongPress!();
      },
      child: child,
    );
  }
}
