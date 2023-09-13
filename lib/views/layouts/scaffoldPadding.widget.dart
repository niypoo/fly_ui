import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';

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
        left: AppConfigService.to.space!.m,
        right: AppConfigService.to.space!.m,
      ),
      child: child,
    );
  }
}
