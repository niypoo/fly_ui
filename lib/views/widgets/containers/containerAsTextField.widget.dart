import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/continerColored.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
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
        margin: EdgeInsets.only(bottom: 8.sp),
        padding: EdgeInsets.only(
          left: 10.sp,
          right: 10.sp,
          top: 2.sp,
          bottom: 4.sp,
        ),
        color: bgColor ?? Get.theme.cardColor,
        colorBorder: textColor ?? Get.theme.cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            if (title != null)
              AutoSizeText(
                title!,
                style: Get.textTheme.titleSmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

            // value and suffix
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    value,
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      color: disabled
                          ? Get.textTheme.labelLarge!.color!.withOpacity(0.4)
                          : null,
                    ),
                  ),
                ),
                if (suffix != null && suffix is Widget)
                  suffix
                else if (suffix != null)
                  SuffixText(text: suffix)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
