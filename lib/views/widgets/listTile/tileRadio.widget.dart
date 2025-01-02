import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileInput.widget.dart';
import 'package:get/get.dart';

class FlyRadioListTile extends StatelessWidget {
  const FlyRadioListTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.value,
    required this.selectedValue,
    this.subtitle,
    this.bgColor,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final dynamic value;
  final dynamic selectedValue;
  final Function onTap;
  final String? subtitle;
  final bool outline;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return FlyListTileInput(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      child: Radio(
        activeColor: (value == selectedValue)
            ? Get.theme.primaryColor
            : Get.theme.cardColor,
        value: value,
        groupValue: selectedValue,
        onChanged: (dynamic value) => onTap(value),
      ),
    );
  }
}
