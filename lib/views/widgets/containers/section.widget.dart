import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/divider.widget.dart';
import 'package:get/get.dart';

class FlySection extends StatefulWidget {
  const FlySection({
    super.key,
    required this.title,
    required this.children,
    this.divider = true,
    this.expanded = true,
  });

  final String title;
  final List<Widget> children;
  final bool divider;
  final bool expanded;

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

  // toggle
  toggle() => setState(() {
        expanded = !expanded;
      });

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: Get.theme.scaffoldBackgroundColor,
      margin: EdgeInsets.only(bottom: 8.sp),
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Column(
        children: [
          GestureDetector(
            onTap: toggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Get.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          if (expanded)
            Padding(
              padding: EdgeInsets.only(top: 8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: widget.children,
              ),
            ),
        ],
      ),
    );
  }
}
