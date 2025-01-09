import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedSlide.widget.dart';
import 'package:fly_ui/views/widgets/divider.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlySection extends StatefulWidget {
  const FlySection({
    super.key,
    required this.title,
    required this.children,
    this.expanded = true,
    this.divider = true,
  });

  final String title;
  final List<Widget> children;
  final bool expanded;
  final bool divider;

  @override
  State<FlySection> createState() => _FlySectionState();
}

class _FlySectionState extends State<FlySection> {
  bool expanded = true;

  @override
  void initState() {
    expanded = widget.expanded;
    super.initState();
  }

  toggle() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: GestureDetector(
              onTap: toggle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),

                  // ICON
                  Icon(expanded ? Icons.arrow_drop_down : Icons.arrow_drop_up)
                ],
              ),
            ),
          ),
          FadeIn(
            preferences: AnimationPreferences(
                autoPlay: expanded
                    ? AnimationPlayStates.Forward
                    : AnimationPlayStates.Reverse),
            child: Column(
              children: [
                ...widget.children,
                if (widget.divider) const FlyDivider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
