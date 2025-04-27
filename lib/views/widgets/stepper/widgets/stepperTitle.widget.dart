import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyStepperTitle extends StatelessWidget {
  const FlyStepperTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: Get.textTheme.titleLarge,
    );
  }
}
