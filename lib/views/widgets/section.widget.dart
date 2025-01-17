import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepBottomHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepSubHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepTitle.widget.dart';
import 'package:get/get.dart';

class FlySection extends StatelessWidget {
  const FlySection({
    super.key,
    required this.child,
    required this.title,
    this.subtitle,
    this.hint,
    this.bottomHint,
    this.divider = false,
  });

  final Widget child;
  final String title;
  final String? subtitle;
  final String? hint;
  final String? bottomHint;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          FlyMultiStepTitle(title: title),
          FlyMultiStepHint(hint: subtitle),
          FlyMultiStepSubHint(subHint: hint),
          SizedBox(height: 8.sp),

          // Children
          child,

          // END HINT
          FlyMultiStepBottomHint(endHint: bottomHint),

          if (divider)
            Divider(
              color: Get.iconColor!.withOpacity(0.1),
              height: 10.sp,
              indent: 10.sp,
              endIndent: 10.sp,
            ),
        ],
      ),
    );
  }
}
