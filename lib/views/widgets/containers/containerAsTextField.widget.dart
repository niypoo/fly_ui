import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
    this.title,
    this.bgColor,
    this.disabled = false,
  }) : super(key: key);

  final Function onChangeValueTap;
  final String? title;
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
        // padding: EdgeInsets.all(AppConfigService.to.space!.m),
        margin: EdgeInsets.only(bottom: 0.5.h),
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 3.w,
        ),
        color: bgColor ?? Get.theme.scaffoldBackgroundColor,
        colorBorder: textColor ?? Get.theme.cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            if (title != null)
              AutoSizeText(
                title!,
                style: Get.textTheme.bodySmall,
              ),

            // value and suffix
            Row(
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
                    style: Get.textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: disabled
                          ? Get.textTheme.bodyMedium!.color!.withOpacity(0.4)
                          : null,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
