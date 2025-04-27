import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyScaffoldPadding extends StatelessWidget {
  const FlyScaffoldPadding({
    Key? key,
    required this.child,
    this.disabled = false,
  }) : super(key: key);

  final Widget? child;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: disabled ? 0 : context.isPhone ? 3.sp : 5.sp),
      child: child,
    );
  }
}

class FlyScaffoldPreferredPadding extends StatelessWidget
    implements PreferredSizeWidget {
  const FlyScaffoldPreferredPadding({
    Key? key,
    required this.child,
    this.disabled = false,
  }) : super(key: key);

  final Widget? child;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FlyScaffoldPadding(disabled: disabled, child: child);
  }

  @override
  Size get preferredSize {
    // return const Size.fromHeight(kToolbarHeight);
    return  Size.fromHeight(45.sp);
  }
}
