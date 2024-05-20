import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:get/get.dart';

class FlyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlyAppBar({
    Key? key,
    this.title,
    this.actions = const [],
    this.leading,
    this.bottom,
    this.backgroundColor,
    this.titleTextStyle,
    this.leadingWidth,
    this.centerTitle = false,
    this.padding,
    this.titleSpacing,
    this.scrolledUnderElevation = 0.0,
  }) : super(key: key);

  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double? leadingWidth;
  final bool centerTitle;
  final double? padding;
  final double? titleSpacing;
  final double? scrolledUnderElevation;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation:
          scrolledUnderElevation, //fix matrial 3 shadow scroll
      backgroundColor: backgroundColor ?? Get.theme.scaffoldBackgroundColor,
      titleSpacing: titleSpacing ?? (context.isPhone ? 3.sw : 5.sw),
      title: Row(
        children: [
          leading ??
              Padding(
                padding: EdgeInsetsDirectional.only(end: 10.sp),
                child: FlyIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Get.back(),
                ),
              ),
          Flexible(
            child: AutoSizeText(
              title != null ? title!.toUpperCase() : '',
              style: titleTextStyle ??
                  Get.textTheme.headlineMedium!.copyWith(
                    fontSize: 20.sp,
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),

      actions: [
        Wrap(
          spacing: 5.sp,
          runSpacing: 5.sp,
          alignment: WrapAlignment.end,
          runAlignment: WrapAlignment.end,
          children: actions,
        ),
        // SizedBox(width: context.isPhone ? 3.sw : 5.sw)
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
    // return  Size.fromHeight(8.h);
  }
}
