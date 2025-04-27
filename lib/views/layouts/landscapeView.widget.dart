import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/layouts/landscapeDivider.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyLandscapeView extends StatelessWidget {
  const FlyLandscapeView({
    super.key,
    required this.childA,
    required this.childB,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final Widget childA;
  final Widget childB;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Expanded(child: childA),

        // divider
        const FlyLandscapeDivider(),

        Expanded(child: childB),
      ],
    );
  }
}

class FlyLandScapeScroll extends StatelessWidget {
  const FlyLandScapeScroll({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 45.sp),
      child: child,
    );
  }
}

class FlyLandscapeScrollableView extends StatelessWidget {
  const FlyLandscapeScrollableView({
    super.key,
    required this.childA,
    required this.childB,
  });

  final Widget childA;
  final Widget childB;
  @override
  Widget build(BuildContext context) {
    return FlyLandscapeView(
      childA: FlyLandScapeScroll(
        child: childA,
      ),
      childB: FlyLandScapeScroll(
        child: childB,
      ),
    );
  }
}

class FlyLandscapeCenterView extends StatelessWidget {
  const FlyLandscapeCenterView({
    super.key,
    this.children = const [],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.1 * Get.width,
        right: 0.1 * Get.width,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0.1 * Get.width,
        ),
        child: Column(children: children),
      ),
    );
  }
}
