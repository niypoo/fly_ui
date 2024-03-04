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
      scrolledUnderElevation:
          scrolledUnderElevation, //fix matrial 3 shadow scroll
      backgroundColor: backgroundColor ?? Get.theme.scaffoldBackgroundColor,
      titleSpacing: titleSpacing,
      title: AutoSizeText(
        title ?? '',
        style: titleTextStyle ??
            Get.textTheme.headlineMedium!.copyWith(
              fontSize: 20.sp,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.start,
      ),
      leading: Padding(
        padding:  EdgeInsets.only(
          left: 5.sp,
          right: 5.sp,
          bottom: 5.sp,
        ),
        child: leading ??
            FlyIconButton(
              icon: Icons.arrow_back,
              onPressed: () => Get.back(),
            ),
      ),
      actions: [
        Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.end,
          runAlignment: WrapAlignment.end,
          children: actions,
        )
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
