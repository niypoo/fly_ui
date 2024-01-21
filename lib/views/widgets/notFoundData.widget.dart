import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyNotFoundData extends StatelessWidget {
  const FlyNotFoundData({
    Key? key,
    this.title,
    this.icon,
    this.enableTopMergin = true,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final bool enableTopMergin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (enableTopMergin) SizedBox(height: 30.sp),
        Icon(icon ?? UniconsLine.exclamation, size: 20.sp),
        SizedBox(height: 5.sp),
        AutoSizeText(title ?? 'No data provided yet.'.tr),
      ],
    );
  }
}
