import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlySwitchTile extends StatelessWidget {
  const FlySwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    this.value = false,
    this.onChange,
    this.color,
    this.bgColor,
    this.child,
    this.outline = true,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final Function? onChange;
  final Color? color;
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
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChange as void Function(bool)?,
        activeTrackColor: color ?? Get.theme.primaryColor,
        inactiveTrackColor: Colors.black26,
      ),
      child: value ? child : null,
    );
  }
}
