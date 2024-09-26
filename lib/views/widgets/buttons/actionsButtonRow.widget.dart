import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
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
            (w) {
              return Flexible(
                flex: actions.first == w ? 2 : 1,
                child: FlyElevatedButton.primary(
                  title: 'Add',
                  onPressed: () {},
                  margin: EdgeInsetsDirectional.only(
                    end: actions.last == w ? 0 : 5.sp,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
