import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyStepperSubtitle extends StatelessWidget {
  const FlyStepperSubtitle({
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
            style: Get.textTheme.titleMedium
          );
  }
}
