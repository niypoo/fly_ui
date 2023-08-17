import 'package:app_config/appInfo.config.dart';
import 'package:flutter/material.dart';

class FlyScaffoldPadding extends StatelessWidget {
  const FlyScaffoldPadding({
    Key? key,
    this.child,
    this.enablePadding = true,
  }) : super(key: key);

  final Widget? child;
  final bool enablePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConfigService.to.space!.m,
        right: AppConfigService.to.space!.m,
      ),
      child: child,
    );
  }
}
