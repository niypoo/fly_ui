import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlySwitchTile extends StatelessWidget {
  const FlySwitchTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.value = false,
    this.onChange,
    this.color,
    this.bgColor,
    this.child,
    this.leading,
    this.outline = true,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function? onChange;
  final Color? color;
  final bool outline;
  final Color? bgColor;
  final Widget? child;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      leading: leading,
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
