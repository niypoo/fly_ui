import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/cards/setting.widget.dart';
import 'package:get/get.dart';

class FlySettingIconCard extends StatelessWidget {
  const FlySettingIconCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.bgColor,
    this.iconColor,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Function? onTap;
  final Color? bgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return FlySettingCard(
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      bgColor: bgColor,
      iconColor: iconColor,
      trailing: Icon(
        icon ?? Icons.arrow_forward_ios_rounded,
        color: iconColor ?? Get.theme.iconTheme.color,
        size: 15.sp
      ),
    );
  }
}
