import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyTableRow extends StatelessWidget {
  const FlyTableRow({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.onTap,
    this.bottomHint,
  });

  final Function? onTap;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? bottomHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlyInkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: children),
              if (bottomHint != null) bottomHint!,
            ],
          ),
        ),
        Divider(
          color: Get.theme.cardColor,
          indent: 5.sp,
          endIndent: 5.sp,
          height: 15.sp,
        ),
      ],
    );
  }
}
