import 'package:app_config/appInfo.config.dart';
import 'package:flutter/material.dart';

class FlyGridView extends StatelessWidget {
  const FlyGridView({
    Key? key,
    required this.children,
    this.min = 1,
    this.max = 2,
  }) : super(key: key);

  final List<Widget> children;
  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: AppConfigService.to.space!.s),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 100,
        crossAxisCount: children.length == min ? min : max,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: children,
    );
  }
}
