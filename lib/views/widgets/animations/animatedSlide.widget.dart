import 'package:app_config/appInfo.config.dart';
import 'package:flutter/material.dart';

class FlyAnimatedSwitcher extends StatelessWidget {
  const FlyAnimatedSwitcher({
    Key? key,
    required this.child1,
    required this.child2,
    this.crossState = true,
    this.dx = 0,
    this.dy = -1,
  }) : super(key: key);

  final Widget child1;
  final Widget child2;
  final bool crossState;
  final double dx;
  final double dy;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppConfigService.to.duration,
      switchOutCurve: Curves.linear,
      reverseDuration: AppConfigService.to.duration,
      switchInCurve: AppConfigService.to.curve,
      transitionBuilder: (child, animation) => SlideTransition(
        position: Tween<Offset>(begin: Offset(dx, dy), end: const Offset(0, 0))
            .animate(animation),
        child: child,
      ),
      child: crossState ? child1 : child2,
    );
  }
}
