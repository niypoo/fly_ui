import 'package:app_config/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyIconButton extends StatelessWidget {
  const FlyIconButton({
    Key? key,
    required this.icon,
    this.color,
    this.bgColor,
    this.onPressed,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final Color? bgColor;
  final Color? color;
  final IconData icon;
  final Function? onPressed;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      padding: padding,
      margin: margin,
      radius: AppConfigService.to.radius,
      color: bgColor ?? Get.theme.cardColor,
      child: IconButton(
        constraints: const BoxConstraints(),
        onPressed: onPressed as void Function()?,
        icon: Icon(icon, color: color ?? Get.theme.iconTheme.color),
      ),
    );
  }
}
