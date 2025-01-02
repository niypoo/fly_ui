import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileInput.widget.dart';
import 'package:get/get.dart';

class FlyDropdownTile extends StatelessWidget {
  const FlyDropdownTile({
    Key? key,
    required this.title,
    required this.items,
    required this.value,
    required this.onTap,
    this.subtitle,
    this.outline = false,
    this.bgColor,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String value;
  final Function onTap;
  final bool outline;
  final Color? bgColor;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return FlyListTileInput(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          elevation: 0,
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: Get.theme.cardColor,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onTap as void Function(String?)?,
        ),
      ),
    );
  }
}
