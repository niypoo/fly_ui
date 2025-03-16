import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/layouts/scaffoldPadding.widget.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyAppBar extends StatelessWidget implements PreferredSizeWidget {
const FlyAppBar({
    Key? key,
    this.title,
    this.actions = const [],
    this.leading,
    this.bottom,
    this.backgroundColor,
    this.titleTextStyle,
    // this.leadingWidth,
    this.centerTitle = false,
    this.disabledPadding = true,
    // this.titleSpacing,
    this.scrolledUnderElevation = 0.0,
  }) : super(key: key);

  final String? title;
  final List<Widget> actions;
  final Widget? leading;
  final Color? backgroundColor;
  // final double? leadingWidth;
  final bool centerTitle;
  final bool disabledPadding;
  // final double? titleSpacing;
  final double? scrolledUnderElevation;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return FlyScaffoldPadding(
      disabled: disabledPadding,
      child: AppBar(
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: scrolledUnderElevation,
        backgroundColor: backgroundColor ?? Get.theme.scaffoldBackgroundColor,
        // titleSpacing: titleSpacing ?? (context.isPhone ? 3.sw : 5.sw),
        leadingWidth: 28.sp,
        leading: leading ??
            FlyIconButton(
              icon: UniconsLine.multiply,
              onPressed: () => Get.back(),
              // size: 19.sp,
            ),
        title: title == null
            ? null
            : AutoSizeText(
                title!,
                style: titleTextStyle,
                textAlign: TextAlign.start,
              ),
        actions: [
          Wrap(
            spacing: 5.sp,
            runSpacing: 0,
            alignment: WrapAlignment.end,
            runAlignment: WrapAlignment.end,
            children: actions,
          ),
          // SizedBox(width: context.isPhone ? 3.sw : 5.sw)
        ],
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
    // return  Size.fromHeight(8.h);
  }
}
