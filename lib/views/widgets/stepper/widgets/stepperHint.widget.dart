import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyStepperHint extends StatelessWidget {
  const FlyStepperHint({
    Key? key,
    required this.subHint,
  }) : super(key: key);

  final String? subHint;

  @override
  Widget build(BuildContext context) {
    return subHint == null
        ? const SizedBox.shrink()
        : AutoSizeText(
            subHint!,
            style: Get.textTheme.bodyMedium
          );
  }
}
