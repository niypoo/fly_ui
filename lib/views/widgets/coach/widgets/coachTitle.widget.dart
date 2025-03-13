import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyCoachTitle extends StatelessWidget {
  const FlyCoachTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: Get.textTheme.displayMedium!.copyWith(color: Get.theme.primaryColor),
      // textAlign: TextAlign.center,
    );
  }
}
