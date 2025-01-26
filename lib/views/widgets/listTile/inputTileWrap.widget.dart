import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileTableRow.widget.dart';
import 'package:get/get.dart';

class FlyInputTileWrap extends StatelessWidget {
  const FlyInputTileWrap({
    Key? key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.bgColor,
    this.child,
    this.leading,
    this.padding,
    this.outline = true,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool outline;
  final Color? bgColor;
  final Widget? trailing;
  final Widget? child;
  final Widget? leading;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
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
              Expanded(
                child: leading ??
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: ValueKey(title),
                          child: AutoSizeText(
                            title,
                            style: Get.textTheme.titleSmall,
                            maxLines: 1,
                          ),
                        ),
                        if (subtitle != null)
                          AutoSizeText(
                            subtitle!,
                            style: Get.textTheme.bodySmall,
                            maxLines: 1,
                          ),
                      ],
                    ),
              ),
              if (trailing != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.sp),
                  child: const FlyListTitleLogDivider(),
                ),
              if (trailing != null) trailing!,
            ],
          ),

          // if(child!=null) const FlyDivider(),
          if (child != null)
            Padding(
              padding: EdgeInsets.only(top: 10.sp),
              child: child!,
            ),
        ],
      ),
    );
  }
}
