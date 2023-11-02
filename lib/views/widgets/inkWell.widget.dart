import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

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
      borderRadius: BorderRadius.circular(8.sp),
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
