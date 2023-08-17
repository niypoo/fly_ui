import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyResponsiveView extends StatelessWidget {
  const FlyResponsiveView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.isLandscape ? 0.1 * Get.width : 0,
        right: context.isLandscape ? 0.1 * Get.width : 0,
      ),
      child: child,
    );
  }
}
