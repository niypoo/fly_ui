import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';

class FlyCheckboxTile extends StatelessWidget {
  const FlyCheckboxTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.value,
    this.subtitle,
    this.outline = false,
    this.bgColor,
    this.expandChild,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function onTap;
  final bool outline;
  final Color? bgColor;
  final Widget? expandChild;

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      expandChild: expandChild,
      child: FlyTextField(
        labelText: 'Enter your tags',
      ),
    );
  }
}
