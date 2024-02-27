import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
      splashColor: Get.theme.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10.sp),
      onTap: () {
        if (onTap != null) onTap!();
      },
      onLongPress: () {
        if (onLongPress != null) onLongPress!();
      },
      child: child,
    );
  }
}
