import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyListTile extends StatelessWidget {
  const FlyListTile({
    Key? key,
    required this.title,
    this.value,
    this.leading,
    this.subtitle,
    this.onTap,
    this.enableDivider = true,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final dynamic value;
  final dynamic subtitle;
  final bool enableDivider;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap as void Function()?,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
          contentPadding: EdgeInsets.all(10.sp),
          leading: leading,
          title: Text(
            title,
            style: Get.textTheme.labelLarge,
          ),
          subtitle: subtitle is String
              ? Text(
                  subtitle,
                  style: Get.textTheme.bodyMedium,
                )
              : subtitle,
          trailing: value is String
              ? Text(
                  value,
                  style: Get.textTheme.bodyMedium,
                )
              : value,
        ),
        if (enableDivider) Divider(color: Get.theme.cardColor),
      ],
    );
  }
}
