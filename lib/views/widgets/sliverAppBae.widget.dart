import 'package:flutter/material.dart';

class FlySliverAppBar extends SliverPersistentHeaderDelegate {
  final dynamic title;
  final Widget? leading;
  final List<Widget>? actions;
  final double initMinExtent;
  final double initMaxExtent;

  FlySliverAppBar({
    this.title,
    this.leading,
    this.actions,
    this.initMinExtent = 0,
    this.initMaxExtent = 60,
  });

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  double get maxExtent => initMaxExtent;

  @override
  double get minExtent => initMinExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
