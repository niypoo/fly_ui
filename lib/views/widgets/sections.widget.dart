import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
      padding: EdgeInsets.only(top: 15.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: child,
          ),
          if (divider)
            Divider(
              color: Get.iconColor!.withOpacity(0.2),
              height: 10.sp,
              indent: 10.sp,
              endIndent: 10.sp,
            ),
        ],
      ),
    );
  }
}
