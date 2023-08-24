import 'package:flutter/material.dart';

class FlySliverContainer extends SliverPersistentHeaderDelegate {
  FlySliverContainer({
    required this.child,
    this.initMinExtent = 0,
    this.initMaxExtent = 0,
  });

  final Widget Function(bool isCollapse, double shrinkOffset) child;
  final double initMinExtent;
  final double initMaxExtent;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return child((minExtent <= shrinkOffset), shrinkOffset);
  }

  @override
  double get maxExtent => initMaxExtent;

  @override
  double get minExtent => initMinExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
