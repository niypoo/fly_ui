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
      padding: EdgeInsets.only(
        left: disabled
            ? 0
            : context.isPhone
                ? 3.sw
                : 5.sw,
        right: disabled
            ? 0
            : context.isPhone
                ? 3.sw
                : 5.sw,
      ),
      child: child,
    );
  }
}
