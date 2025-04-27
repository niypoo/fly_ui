import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyCoachTitle extends StatelessWidget {
  const FlyCoachTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.primaryColor),
      // textAlign: TextAlign.center,
    );
  }
}
