import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyRouteTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: FadeThroughTransition(
        fillColor: Get.theme.scaffoldBackgroundColor,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
    );
  }
}
