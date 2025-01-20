import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class ActionsButtonsRow extends StatelessWidget {
  const ActionsButtonsRow({
    super.key,
    this.actions = const [],
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          color: Get.theme.cardColor,
          indent: 10.sp,
          endIndent: 10.sp,
          height: 20.sp,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: actions.map(
            (widget) {
              return Flexible(
                flex: actions.first == widget ? 2 : 1,
                child: widget
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
