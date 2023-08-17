import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/circalButton.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyIncrementContainer extends StatelessWidget {
  const FlyIncrementContainer({
    Key? key,
    this.color,
    this.textColor,
    this.incrementTap,
    this.decrementTap,
    required this.value,
    this.label,
  }) : super(key: key);

  final Color? color;
  final Color? textColor;
  final Function? decrementTap;
  final Function? incrementTap;
  final num value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      padding: EdgeInsets.all(AppConfigService.to.space!.xs),
      radius: 25,
      color: color,
      child: Row(
        children: [
          // Decrement
          FlyCircleButton(
            color: textColor ?? Get.theme.scaffoldBackgroundColor,
            icon: UniconsLine.minus,
            onPressed: decrementTap,
          ),

          Expanded(
            child: Center(
              child: AutoSizeText(
                '$value $label',
                style: Get.textTheme.titleMedium!.copyWith(color: textColor),
              ),
            ),
          ),

          // increment
          FlyCircleButton(
            color: textColor ?? Get.theme.scaffoldBackgroundColor,
            icon: UniconsLine.plus,
            onPressed: incrementTap,
          ),
        ],
      ),
    );
  }
}
