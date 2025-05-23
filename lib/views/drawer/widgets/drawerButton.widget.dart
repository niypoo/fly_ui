import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
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
    return FlyInkWell(
      onTap: onTap as void Function()?,
      child: FlyContainer(
        margin: EdgeInsets.only(bottom: 8.sp),
        padding: EdgeInsets.symmetric(
          vertical: 8.sp,
          horizontal: 10.sp,
        ),
        color: bgColor ?? Get.theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 13.sp,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.sp,
                ),
                child: AutoSizeText(
                  title,
                  style: Get.textTheme.labelLarge!.copyWith(
                    color: color,
                    // height: 1.3,
                    // fontSize: 10.sp,
                    // fontWeight: FontWeight.w800
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            if (value != null)
              AutoSizeText(
                value!,
                style: Get.textTheme.labelSmall!.copyWith(
                  color: color,
                  // fontWeight: FontWeight.w300,
                  // fontSize: 10.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
