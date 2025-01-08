import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlyDropdownTile extends StatelessWidget {
  const FlyDropdownTile({
    Key? key,
    required this.title,
    required this.items,
    required this.value,
    required this.onTap,
    this.subtitle,
    this.outline = true,
    this.bgColor,
    this.child,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String value;
  final Function onTap;
  final bool outline;
  final Color? bgColor;
  final Widget? child;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      padding: const EdgeInsets.all(0),
      trailing: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.sp),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            elevation: 0,
            icon: const Icon(Icons.arrow_drop_down),
            dropdownColor: Get.theme.cardColor,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: Get.textTheme.labelMedium),
              );
            }).toList(),
            onChanged: onTap as void Function(String?)?,
          ),
        ),
      ),
      child:child,
    );
  }
}
