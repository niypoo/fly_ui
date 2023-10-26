import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlyScaffoldPadding extends StatelessWidget {
  const FlyScaffoldPadding({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.isTablet ? 15.w : 5.w,
        right: context.isTablet ? 15.w : 5.w,
      ),
      child: child,
    );
  }
}
