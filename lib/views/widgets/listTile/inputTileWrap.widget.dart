import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/tileTableRow.widget.dart';
import 'package:get/get.dart';

class FlyInputTileWrap extends StatelessWidget {
  const FlyInputTileWrap({
    Key? key,
    required this.title,
    required this.trailing,
    this.subtitle,
    this.bgColor,
    this.child,
    this.leading,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool outline;
  final Color? bgColor;
  final Widget trailing;
  final Widget? child;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 10.sp),
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
                        AutoSizeText(
                          title,
                          style: Get.textTheme.titleMedium!.copyWith(
                            height: 1,
                            fontWeight: FontWeight.w500,
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
                                height: 0,
                              ),
                              maxLines: 3,
                            ),
                          ),
                      ],
                    ),
              ),
              const FlyListTitleLogDivider(),
              trailing,
            ],
          ),

          // if(expandChild!=null) const FlyDivider(),
          if (child != null)
            Padding(
              padding: EdgeInsets.only(
                top: 15.sp,
              ),
              child: child!,
            ),
        ],
      ),
    );
  }
}
