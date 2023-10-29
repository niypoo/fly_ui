import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyMultiStepHint extends StatelessWidget {
  const FlyMultiStepHint({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return hint == null
        ? const SizedBox.shrink()
        : AutoSizeText(
            hint!,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400
            ),
          );
  }
}
