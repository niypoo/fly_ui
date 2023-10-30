import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

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
        left: 5.w,
        right:5.w,
      ),
      child: child,
    );
  }
}
