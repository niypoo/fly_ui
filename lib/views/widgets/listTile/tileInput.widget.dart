import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileTableRow.widget.dart';
import 'package:get/get.dart';

class FlyListTileInput extends StatelessWidget {
  const FlyListTileInput({
    Key? key,
    required this.title,
    required this.child,
    this.subtitle,
    this.bgColor,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool outline;
  final Color? bgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      margin: EdgeInsets.only(bottom: 6.sp),
      color: bgColor ?? (outline? Get.theme.scaffoldBackgroundColor : Get.theme.cardColor),
      outline: outline,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  style: Get.textTheme.titleSmall!.copyWith(
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                if (subtitle != null)
                  Padding(
                    padding: EdgeInsets.only(top: 3.sp),
                    child: AutoSizeText(
                      subtitle!,
                      style: Get.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 11.sp,
                      ),
                      maxLines: 3,
                    ),
                  ),
              ],
            ),
          ),
          const FlyListTitleLogDivider(),
          child,
        ],
      ),
    );
  }
}
