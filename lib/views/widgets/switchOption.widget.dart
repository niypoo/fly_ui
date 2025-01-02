import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileInput.widget.dart';
import 'package:get/get.dart';

class FlySwitchOption extends StatelessWidget {
  const FlySwitchOption({
    Key? key,
    required this.title,
    this.subtitle,
    this.value = false,
    this.onChange,
    this.color,
    this.bgColor,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function? onChange;
  final Color? color;
  final bool outline;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return FlyListTileInput(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      child: CupertinoSwitch(
        value: value,
        onChanged: onChange as void Function(bool)?,
        activeColor: color ?? Get.theme.primaryColor,
        trackColor: Colors.black26,
      ),
    );
  }
}
