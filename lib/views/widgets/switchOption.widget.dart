import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:flutter/material.dart';
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
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function? onChange;
  final Color? color;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: bgColor,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  style: Get.textTheme.titleSmall!.copyWith(
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                if (subtitle != null)
                  AutoSizeText(
                    subtitle!,
                    style: Get.textTheme.bodySmall!.copyWith(height: 1),
                    maxLines: 2,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChange as void Function(bool)?,
              activeColor: color ?? Get.theme.primaryColor,
              trackColor: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
