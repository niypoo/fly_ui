import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyExpandedSection extends StatefulWidget {
  const FlyExpandedSection({
    super.key,
    required this.title,
    required this.children,
    this.divider = true,
    this.expanded = true,
    this.showExpandedButton = true,
  });

  final String title;
  final List<Widget> children;
  final bool divider;
  final bool expanded;
  final bool showExpandedButton;

  @override
  State<FlyExpandedSection> createState() => _FlyExpandedSectionState();
}

class _FlyExpandedSectionState extends State<FlyExpandedSection> {
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
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.showExpandedButton ? toggle : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Get.textTheme.titleMedium,
                ),
                if (widget.showExpandedButton) const Icon(UniconsLine.direction)
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
