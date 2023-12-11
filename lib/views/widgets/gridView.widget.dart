import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(bottom: AppConfigService.to.space!.s),
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
