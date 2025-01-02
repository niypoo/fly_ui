import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileInput.widget.dart';
import 'package:get/get.dart';

class FlyRadioListTile extends StatelessWidget {
  const FlyRadioListTile({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.value,
    required this.selectedValue,
    this.subtitle,
    this.bgColor,
    this.expandedChild,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final dynamic value;
  final dynamic selectedValue;
  final Function onChanged;
  final String? subtitle;
  final bool outline;
  final Color? bgColor;
  final Widget? expandedChild;

  @override
  Widget build(BuildContext context) {
    return FlyListTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      expandedChild: expandedChild,
      child: Radio(
        activeColor: (value == selectedValue)
            ? Get.theme.primaryColor
            : Get.theme.cardColor,
        value: value,
        groupValue: selectedValue,
        onChanged: (dynamic value) => onChanged(value),
      ),
    );
  }
}
