import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
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
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function onTap;
  final bool outline;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      margin: EdgeInsets.only(bottom: 6.sp),
      color: bgColor ?? Get.theme.scaffoldBackgroundColor,
      outline: outline,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp),
                    child: AutoSizeText(
                      subtitle!,
                      style: Get.textTheme.bodySmall!.copyWith(height: 1),
                      maxLines: 2,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 30.sp,
            child: Checkbox(
              activeColor: Get.theme.cardColor,
              checkColor: Get.theme.primaryColor,
              value: value,
              onChanged: onTap as void Function(bool?)?,
            ),
          ),
        ],
      ),
    );
  }
}
