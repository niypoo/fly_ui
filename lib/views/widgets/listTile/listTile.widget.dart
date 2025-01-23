import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/listTile/tileTableRow.widget.dart';
import 'package:get/get.dart';

class FlyListTile extends StatelessWidget {
  const FlyListTile({
    Key? key,
    required this.title,
    this.value,
    this.onTap,
    this.trailing,
    this.leading,
    this.bgColor,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final String? value;
  final Widget? trailing;
  final Widget? leading;
  final Function? onTap;
  final Color? bgColor;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      child: FlyContainer(
        margin: EdgeInsets.only(bottom: 6.sp),
        color: bgColor ??
            (outline ? Get.theme.scaffoldBackgroundColor : Get.theme.cardColor),
        outline: outline,
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: EdgeInsetsDirectional.only(end: 10.sp),
                child: leading!,
              ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title,
                    style: Get.textTheme.titleSmall,
                    maxLines: 1,
                  ),
                  if (value != null)
                    Padding(
                      padding: EdgeInsets.only(top: 3.sp),
                      child: AutoSizeText(
                        value!,
                        style: Get.textTheme.bodyMedium,
                        maxLines: 3,
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null) const FlyListTitleLogDivider(),
            if (trailing != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}
