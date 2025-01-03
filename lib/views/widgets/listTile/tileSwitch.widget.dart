import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/listTileWrap.widget.dart';
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
    this.expandChild,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function? onChange;
  final Color? color;
  final bool outline;
  final Color? bgColor;
  final Widget? expandChild;

  @override
  Widget build(BuildContext context) {
    return FlyListTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      expandChild: expandChild,
      child: CupertinoSwitch(
        value: value,
        onChanged: onChange as void Function(bool)?,
        activeColor: color ?? Get.theme.primaryColor,
        trackColor: Colors.black26,
      ),
    );
  }
}
