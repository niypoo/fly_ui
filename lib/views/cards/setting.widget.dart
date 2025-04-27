import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlySettingCard extends StatelessWidget {
  const FlySettingCard({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.bgColor,
    this.iconColor,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Function? onTap;
  final Color? bgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: bgColor ?? Get.theme.cardColor,
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.only(bottom: 6.sp),
      child: ListTile(
        onTap: onTap as void Function()?,
        title: AutoSizeText(
          title,
          style: Get.textTheme.labelLarge!.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
        ),
        subtitle: subtitle != null
            ? AutoSizeText(
                subtitle!,
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontSize: 10.sp,
                ),
              )
            : null,
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            trailing!,
          ],
        ),
      ),
    );
  }
}
