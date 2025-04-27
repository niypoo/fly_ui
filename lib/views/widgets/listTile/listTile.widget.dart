import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/listTile/tileTableRow.widget.dart';
import 'package:get/get.dart';

class FlyListTile extends StatelessWidget {
  const FlyListTile({
    super.key,
    required this.title,
    this.value,
    this.onTap,
    this.onLongPress,
    this.trailing,
    this.leading,
    this.bgColor,
    this.textColor,
    this.padding,
    this.bottomNote,
    this.outline = false,
  });

  final String title;
  final String? value;
  final Widget? trailing;
  final String? bottomNote;
  final Widget? leading;
  final Function? onTap;
  final Function? onLongPress;
  final Color? bgColor;
  final Color? textColor;
  final bool outline;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: FlyContainer(
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
        color: bgColor ??
            (outline ? Get.theme.scaffoldBackgroundColor : Get.theme.cardColor),
        outline: outline,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // leading
                if (leading != null)
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 5.sp),
                    child: leading,
                  ),

                // body
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title,
                        style: Get.textTheme.titleSmall!
                            .copyWith(color: textColor),
                        maxLines: 1,
                      ),
                      if (value != null)
                        AutoSizeText(
                          value!,
                          style: Get.textTheme.bodySmall!
                              .copyWith(color: textColor),
                          maxLines: 2,
                        ),
                    ],
                  ),
                ),
                if (trailing != null) const FlyListTitleLogDivider(),

                if (trailing != null) trailing!,
              ],
            ),

            // if(child!=null) const FlyDivider(),
            if (bottomNote != null)
              Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: AutoSizeText(
                  bottomNote!,
                  style: Get.textTheme.labelSmall!.copyWith(color: textColor),
                  maxLines: 3,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
