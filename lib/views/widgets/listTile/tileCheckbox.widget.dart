import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlyCheckboxTile extends StatelessWidget {
  const FlyCheckboxTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.value,
    this.subtitle,
    this.outline = true,
    this.bgColor,
    this.child,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final Function onTap;
  final bool outline;
  final Color? bgColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      trailing: Checkbox(
        activeColor: Get.theme.cardColor,
        checkColor: Get.theme.primaryColor,
        value: value,
        onChanged: onTap as void Function(bool?)?,
      ),
      child: value ? child : null,
    );
  }
}
