import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';

class FlyGridView extends StatelessWidget {
  const FlyGridView({
    Key? key,
    required this.children,
    this.min = 1,
    this.max = 2,
    this.mainAxisExtent = 100,
    this.mainAxisSpacing = 10,
  }) : super(key: key);

  final List<Widget> children;
  final int min;
  final double mainAxisExtent;
  final double mainAxisSpacing;
  final int max;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 4.sp),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: mainAxisExtent,
        crossAxisCount: children.length == min ? min : max,
        crossAxisSpacing: mainAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      children: children,
    );
  }
}
