import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class FlyStepperNote extends StatelessWidget {
  const FlyStepperNote({
    Key? key,
    required this.endHint,
  }) : super(key: key);

  final String? endHint;

  @override
  Widget build(BuildContext context) {
    return endHint == null
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.only(bottom: 8.sp),
            child: Center(
              child: AutoSizeText(
                endHint!,
                style: Get.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
