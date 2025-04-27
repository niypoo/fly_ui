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
    this.colorBorder,
    this.bgColor,
    this.disabled = false,
  }) : super(key: key);

  final Function onChangeValueTap;
  final String? title;
  final dynamic suffix;
  final Color? textColor;
  final Color? bgColor;
  final Color? colorBorder;
  final String value;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onChangeValueTap,
      child: FlyContainerColored(
        margin: EdgeInsets.only(bottom: 8.sp),
        padding: EdgeInsets.symmetric(horizontal:10.sp, vertical: 8.sp),
        color: bgColor ?? Get.theme.scaffoldBackgroundColor,
        colorBorder: colorBorder ??
            Get.theme.textTheme.bodyLarge!.color!.withOpacity(0.2),
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
                  fontWeight: FontWeight.w800,
                ),
              ),

            // value and suffix
            Row(
              children: [
                Expanded(
                child: AutoSizeText(
                    value,
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontSize: 12.sp,
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
