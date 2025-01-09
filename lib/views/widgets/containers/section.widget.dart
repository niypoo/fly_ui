import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedCrossFade.widget.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/divider.widget.dart';
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
  late bool expanded;

  initStat() {
    expanded = widget.expanded;
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
          Row(
            children: [
              Text(
                widget.title,
                style: Get.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              FlyIconButton(onPressed: toggle, icon: Icons.arrow_drop_down),
            ],
          ),
          FlyAnimatedCrossFade(
            secondChild: Column(
              children: widget.children,
            ),
            firstChild: const SizedBox.shrink(),
            crossFadeState: expanded,
          ),
          if (widget.divider) const FlyDivider(),
        ],
      ),
    );
  }
}
