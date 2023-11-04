import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FlyDrawerButton extends StatelessWidget {
  const FlyDrawerButton({
    Key? key,
    required this.title,
    this.color,
    this.value,
    this.bgColor,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final String title;
  final String? value;
  final Color? color;
  final Color? bgColor;
  final IconData? icon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: FlyContainer(
        margin: EdgeInsets.only(bottom: AppConfigService.to.space!.s),
        padding: EdgeInsets.symmetric(
          vertical: AppConfigService.to.space!.s,
          horizontal: AppConfigService.to.space!.m,
        ),
        color: bgColor ?? Get.theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 12.sp,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConfigService.to.space!.s,
                ),
                child: AutoSizeText(
                  title,
                  style: Get.textTheme.titleSmall!.copyWith(
                    height: 1.3,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            if (value != null)
              AutoSizeText(
                value!,
                style: Get.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: 9.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
