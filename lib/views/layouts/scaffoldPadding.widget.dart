import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyScaffoldPadding extends StatelessWidget {
  const FlyScaffoldPadding(
    PreferredSizeWidget? appBar, {
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.isPhone ? 3.sw : 5.sw,
        right: context.isPhone ? 3.sw : 5.sw,
      ),
      child: child,
    );
  }
}
