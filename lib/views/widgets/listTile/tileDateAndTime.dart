import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlyTileDateAndTime extends StatelessWidget {
  const FlyTileDateAndTime({
    Key? key,
    required this.value,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String value;
  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap:onTap,
      child: FlyInputTileWrap(
        title: title,
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(value, style: Get.textTheme.bodyMedium),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
