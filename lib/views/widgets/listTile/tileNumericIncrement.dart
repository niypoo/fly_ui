import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/listTile/listTile.widget.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:unicons/unicons.dart';

class FlyTileNumericIncrement extends StatelessWidget {
  const FlyTileNumericIncrement({
    Key? key,
    this.incrementTap,
    this.decrementTap,
    required this.value,
    this.title,
  }) : super(key: key);

  final Function? decrementTap;
  final Function? incrementTap;
  final num value;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return FlyListTile(
      title: title ?? '',
      leading: Text(
        value.toString(),
        style: Get.textTheme.titleMedium,
      ),
      trailing: Row(
        children: [
          
          // Decrement
          FlyIconButton.primary(
            icon: UniconsLine.minus,
            onPressed: decrementTap,
          ),

          SizedBox(width: 4.sp),

          // increment
          FlyIconButton.primary(
            icon: UniconsLine.plus,
            onPressed: incrementTap,
          ),
        ],
      ),
    );
  }
}
