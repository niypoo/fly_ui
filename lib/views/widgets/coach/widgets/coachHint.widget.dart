import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class FlyCoachHint extends StatelessWidget {
  const FlyCoachHint({
    Key? key,
    required this.endHint,
  }) : super(key: key);

  final String? endHint;

  @override
  Widget build(BuildContext context) {
    /// If [endHint] is null, return an empty SizedBox
    if(endHint == null) return const SizedBox();

    /// Otherwise, return a Padding widget with a Centered AutoSizeText
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp),
      child: Center(
        child: AutoSizeText(
          endHint! ,
          style: Get.textTheme.labelMedium,
        ),
      ),
    );
  }
}
