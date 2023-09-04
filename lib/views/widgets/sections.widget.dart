import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlySection extends StatelessWidget {
  const FlySection({
    super.key,
    required this.child,
    required this.name,
    this.divider = false,
  });

  final Widget child;
  final String name;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: Get.textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
          if (divider)
            Divider(
              color: Get.iconColor!.withOpacity(0.2),
              height: 8,
              indent: 10,
              endIndent: 10,
            ),
        ],
      ),
    );
  }
}
