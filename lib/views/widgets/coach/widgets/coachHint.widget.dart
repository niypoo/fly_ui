import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';

class FlyCoachHint extends StatelessWidget {
  const FlyCoachHint({
    Key? key,
    required this.endHint,
  }) : super(key: key);

  final String? endHint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp),
      child: Center(
        child: AutoSizeText(
          endHint!,
          style: Get.textTheme.labelMedium,
        ),
      ),
    );
  }
}
