import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyIconOutlineButton extends StatelessWidget {
  const FlyIconOutlineButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.margin,
    this.padding,
  }) : super(key: key);

  final IconData icon;
  final Function? onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(left: AppConfigService.to.space!.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConfigService.to.radius),
        border: Border.all(color: Get.theme.primaryColor),
      ),
      child: IconButton(
        padding:
            padding ?? EdgeInsets.only(left: AppConfigService.to.space!.xs),
        constraints: const BoxConstraints(),
        icon: Icon(icon, size: 14.sp),
        onPressed: onPressed as void Function()?,
        color: Get.theme.primaryColor,
      ),
    );
  }
}
