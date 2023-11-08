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
  }) : super(key: key);

  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double? leadingWidth;
  final bool centerTitle;
  final double? padding;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;

  factory FlyAppBar.backButton({
    String? title,
    List<Widget> actions = const [],
    Color? backgroundColor,
    double? leadingWidth,
    bool centerTitle = false,
    double? padding,
    TextStyle? titleTextStyle,
    PreferredSizeWidget? bottom,
  }) =>
      FlyAppBar(
        title:title,
        actions:actions,
        backgroundColor:backgroundColor,
        leadingWidth:leadingWidth,
        centerTitle:centerTitle,
        padding:padding,
        titleTextStyle:titleTextStyle,
        bottom:bottom,
        leading: FlyIconButton(
          icon: Icons.arrow_back_ios_new,
          onPressed: () => Get.back(),

        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leadingWidth: leadingWidth,
      backgroundColor: backgroundColor,
      title: AutoSizeText(
        title ?? '',
        style: titleTextStyle ??
            Get.textTheme.headlineMedium!.copyWith(
              fontSize: 22.sp,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.w900,
            ),
        textAlign: TextAlign.start,
      ),
      // titleSpacing: padding ?? 0,
      leading: leading,
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
      // centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize {
    // return const Size.fromHeight(kToolbarHeight);
    return  Size.fromHeight(8.h);
  }
}
