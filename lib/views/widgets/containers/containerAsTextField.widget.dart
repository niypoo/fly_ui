import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/containers/continerColored.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyContainerAsTextField extends StatelessWidget {
  const FlyContainerAsTextField({
    Key? key,
    this.textColor,
    required this.onChangeValueTap,
    required this.value,
    this.suffix,
    this.bgColor,
    this.disabled = false,
  }) : super(key: key);

  final Function onChangeValueTap;
  final dynamic suffix;
  final Color? textColor;
  final Color? bgColor;
  final String value;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onChangeValueTap,
      child: FlyContainerColored(
        padding: EdgeInsets.all(AppConfigService.to.space!.m),
        color: bgColor ?? Get.theme.scaffoldBackgroundColor,
        colorBorder: textColor ?? Get.theme.cardColor,
        child: Row(
          children: [
            Expanded(
              child: AutoSizeText(
                value,
                style: Get.textTheme.labelLarge!.copyWith(
                  color: disabled
                      ? Get.textTheme.labelLarge!.color!.withOpacity(0.4)
                      : null,
                ),
              ),
            ),
            if (suffix != null && suffix is Widget)
              suffix
            else if (suffix != null)
              AutoSizeText(
                suffix,
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: disabled
                      ? Get.textTheme.bodyMedium!.color!.withOpacity(0.4)
                      : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
