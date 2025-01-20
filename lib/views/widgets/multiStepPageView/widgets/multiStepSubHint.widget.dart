import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyMultiStepSubHint extends StatelessWidget {
  const FlyMultiStepSubHint({
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
            style: Get.textTheme.bodyMedium!
                .copyWith(fontSize: 8.sp, fontWeight: FontWeight.w300),
          );
  }
}
