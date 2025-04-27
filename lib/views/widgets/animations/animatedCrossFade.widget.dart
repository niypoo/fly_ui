import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';

class FlyAnimatedCrossFade extends StatelessWidget {
  const FlyAnimatedCrossFade({
    Key? key,
    required this.secondChild,
    required this.firstChild,
    this.crossFadeState = true,
  }) : super(key: key);

  final bool crossFadeState;
  final Widget firstChild;
  final Widget secondChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: AppConfigService.to.duration,
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeIn,
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState:
          crossFadeState ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
