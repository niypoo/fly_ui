import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/divider.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyNotFoundData extends StatelessWidget {
  const FlyNotFoundData({
    Key? key,
    this.title,
    this.text,
    this.icon,
    this.marginTop = 0,
    this.iconSize = 30,
    this.actions = const [],
  }) : super(key: key);

  final String? title;
  final String? text;
  final dynamic icon;
  final double marginTop;
  final double iconSize;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
        vertical: 24.sp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: marginTop),
          if (icon.runtimeType == String)
            FlyImage(url: icon, width: 30.w, height: 30.w)
          else
            Icon(
              icon ?? UniconsLine.exclamation,
              size: iconSize.sp,
              color: Get.theme.primaryColor,
            ),
          SizedBox(height: 8.sp),
          AutoSizeText(
            title ?? 'No data provided yet.'.tr,
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          if (text != null)
            AutoSizeText(
              text!,
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

          // Actions
          if (actions.isNotEmpty) const FlyDivider(),
          ...actions,
        ],
      ),
    );
  }
}
