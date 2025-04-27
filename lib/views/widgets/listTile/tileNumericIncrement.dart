import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:unicons/unicons.dart';

class FlyTileNumericIncrement extends StatelessWidget {
  const FlyTileNumericIncrement({
    super.key,
    this.incrementTap,
    this.decrementTap,
    required this.value,
    this.title,
  });

  final Function? decrementTap;
  final Function? incrementTap;
  final num value;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      title: title ?? '',
      leading: Text(
        value.toString(),
        style: Get.textTheme.bodyMedium,
      ),
      trailing: Row(
        children: [
          
          // Decrement
          FlyIconButton.card(
            icon: UniconsLine.minus,
            onPressed: decrementTap,
            size: 24,
          ),

          SizedBox(width: 4.sp),

          // increment
          FlyIconButton.primary(
            icon: UniconsLine.plus,
            onPressed: incrementTap,
            size: 24,
          ),
        ],
      ),
    );
  }
}
