import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyRefreshIndicator extends StatelessWidget {
  const FlyRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: Get.theme.iconTheme.color,
      backgroundColor: Get.theme.cardColor,
      child: child,
    );
  }
}
