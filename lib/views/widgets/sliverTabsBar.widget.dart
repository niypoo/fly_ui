import 'package:fly_ui/views/widgets/tabsBar.widget.dart';
import 'package:flutter/material.dart';

class FlySliverTabsBar extends SliverPersistentHeaderDelegate {
  FlySliverTabsBar({
    required this.tabController,
    required this.tabs,
    this.enablePadding = true,
    this.initMinExtent = 60,
    this.initMaxExtent = 80,
  });

  final TabController tabController;
  final List<Widget> tabs;
  final bool enablePadding;
  final double initMinExtent;
  final double initMaxExtent;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return FlyTabsBar(
      tabController: tabController,
      tabs: tabs,
      enablePadding: enablePadding,
    );
  }

  @override
  double get maxExtent => initMaxExtent;

  @override
  double get minExtent => initMinExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
