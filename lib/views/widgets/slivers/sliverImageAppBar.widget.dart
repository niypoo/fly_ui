import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';

class FlySliverImageAppBar extends StatelessWidget {
  const FlySliverImageAppBar({
    super.key,
    required this.photoUrl,
    required this.title,
    this.expandedHeight = 300,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.radius,
    this.backgroundColor,
    this.stackChildren = const [],
  });

  final String photoUrl;
  final List<Widget> stackChildren;
  final double expandedHeight;
  final bool floating;
  final double? radius;
  final String title;
  final bool pinned;
  final bool snap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      expandedHeight: expandedHeight,
      floating: floating,
      pinned: pinned,
      snap: snap,
      flexibleSpace: FlexibleSpaceBar(
        background: FlyImage(
          url: photoUrl,
          radius: radius,
        ),
        title: Text(title),
        stretchModes: const [StretchMode.zoomBackground],
        expandedTitleScale: 2,
      ),
    );
  }
}
