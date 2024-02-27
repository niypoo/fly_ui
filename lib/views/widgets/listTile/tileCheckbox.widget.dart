import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyCheckboxTile extends StatelessWidget {
  const FlyCheckboxTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.value,
    this.hint,
    this.enableDivider = false,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function onTap;
  final String? hint;
  final bool enableDivider;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: () => onTap(!value),
      child: FlyContainer(
        color: value ? Get.theme.highlightColor : Get.theme.cardColor,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    title,
                    style: Get.textTheme.labelLarge!.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 5.sp),
                SizedBox(
                  height: 20.sp,
                  width: 20.sp,
                  child: Checkbox(
                    activeColor: value
                        ? Get.theme.primaryColor
                        : Get.theme.cardColor,
                    checkColor: Get.theme.primaryColor,
                    value: value,
                    onChanged: onTap as void Function(bool?)?,
                  ),
                ),
              ],
            ),

            if (enableDivider)
              Divider(
                color: Get.theme.primaryColor.withOpacity(0.1),
                height: 10.sp,
              ),

            // hint if STRING OR Widget
            if (hint != null)
              Padding(
                padding: enableDivider
                    ? const EdgeInsets.all(0)
                    : EdgeInsets.only(top: 10.sp),
                child: AutoSizeText(
                  hint!,
                  style: Get.textTheme.bodySmall!.copyWith(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
