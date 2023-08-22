import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';

class FlySliverImageAppBar extends StatelessWidget {
  const FlySliverImageAppBar({
    super.key,
    required this.photoUrl,
    this.expandedHeight = 300,
    this.floating = true,
    this.pinned = true,
    this.snap = true,
  });

  final String photoUrl;
  final double expandedHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: Stack(
        children: <Widget>[
          Positioned.fill(
            child: FlyImage(
              url: photoUrl,
            ),
          )
        ],
      ),
    );
  }
}
