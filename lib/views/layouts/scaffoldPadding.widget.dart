import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        left: context.width * 0.05,
        right: context.width * 0.05,
      ),
      child: child,
    );
  }
}
