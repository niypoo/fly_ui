import 'package:app_config/appInfo.config.dart';
import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(
        AppConfigService.to.radius,
      ),
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
