import 'package:flutter/material.dart';
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
        left: 6.w,
        right: 6.w,
      ),
      child: child,
    );
  }
}
