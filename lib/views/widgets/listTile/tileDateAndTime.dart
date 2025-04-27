import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlyTileDateAndTime extends StatelessWidget {
  const FlyTileDateAndTime({
    super.key,
    required this.value,
    required this.title,
    this.onTap,
    this.outline = false,
  });

  final String value;
  final String title;
  final Function? onTap;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      child: FlyInputTileWrap(
        outline: outline,
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
