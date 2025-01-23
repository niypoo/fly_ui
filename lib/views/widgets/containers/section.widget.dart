import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

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
      color: Get.theme.scaffoldBackgroundColor,
      margin: EdgeInsets.only(bottom: 8.sp),
      padding: EdgeInsets.symmetric(vertical: 10.sp),
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
                if (widget.showExpandedButton) const Icon(Icons.arrow_drop_down)
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
