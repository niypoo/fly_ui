import 'package:flutter/material.dart';

class FlySliverContainer extends SliverPersistentHeaderDelegate {
  FlySliverContainer({
    required this.child,
    this.initMinExtent = 100,
    this.initMaxExtent = 100,
  });

  final Widget child;
  final double initMinExtent;
  final double initMaxExtent;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => initMaxExtent;

  @override
  double get minExtent => initMinExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
