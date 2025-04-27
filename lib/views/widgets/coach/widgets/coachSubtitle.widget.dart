import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyCoachSubtitle extends StatelessWidget {
  const FlyCoachSubtitle({
    super.key,
    required this.hint,
  });

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      hint!,
      style: Get.textTheme.bodyLarge,
      // textAlign: TextAlign.center,
    );
  }
}
