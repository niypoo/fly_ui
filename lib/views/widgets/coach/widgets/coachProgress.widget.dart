import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/progressBar.widget.dart';
import 'package:get/get.dart';

class FlyCoachProgress extends StatelessWidget {
  const FlyCoachProgress({
    Key? key,
    required this.step,
    required this.total,
    this.color,
  }) : super(key: key);

  final int total;
  final int step;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // return widget
    return Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 5.sp),
          child: Text.rich(
            TextSpan(
              text: '',
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                    text: step.toString(), style: Get.textTheme.labelLarge),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'UI.Of'.tr,
                ),
                const TextSpan(text: ' '),
                TextSpan(
                    text: total.toString(), style: Get.textTheme.labelLarge),
              ],
              style: Get.textTheme.labelMedium,
            ),
          ),
        ),

        // if (step <= (total - 1))
        Expanded(
          child: FadeIn(
            child: FlyProgressBar(
              percentage: step / total,
              color: color ?? Get.theme.primaryColor,
            ),
          ),
        ),

      ],
    );
  }
}
