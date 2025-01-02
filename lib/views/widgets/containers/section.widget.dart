import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/divider.widget.dart';
import 'package:get/get.dart';

class FlySection extends StatelessWidget {
  const FlySection({
    super.key,
    required this.title,
    required this.children,
    this.divider = true,
  });

  final String title;
  final List<Widget> children;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(4.sp),
          child: Text(
            title,
            style: Get.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
        if (divider) const FlyDivider(),
      ],
    );
  }
}
