import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/layouts/landscapeDivider.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldPadding.widget.dart';
import 'package:get/get.dart';

class FlyLandscapeView extends StatelessWidget {
  const FlyLandscapeView({
    Key? key,
    required this.childA,
    required this.childB,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

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
        Expanded(child: FlyScaffoldPadding(child: childA)),

        // divider
        const FlyLandscapeDivider(),

        Expanded(child: FlyScaffoldPadding(child: childB)),
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
    Key? key,
    this.children = const [],
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FlyScaffoldPadding(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 0.1 * Get.width,
        ),
        child: Column(children: children),
      ),
    );
  }
}
