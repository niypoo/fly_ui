import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/layouts/landscapeDivider.widget.dart';
import 'package:flutter/material.dart';
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
        Expanded(child: childA),

        // divider
        const FlyLandscapeDivider(),

        Expanded(child: childB),
      ],
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
      childA: SingleChildScrollView(
        padding: EdgeInsets.only(top: 45.sp),
        child: childA,
      ),
      childB: SingleChildScrollView(
        padding: EdgeInsets.only(top: 45.sp),
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
