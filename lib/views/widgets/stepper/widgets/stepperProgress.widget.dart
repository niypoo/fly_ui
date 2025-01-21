import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:fly_ui/views/widgets/progressBar.widget.dart';
import 'package:get/get.dart';

class FlyStepperProgress extends StatelessWidget {
  const FlyStepperProgress({
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
              text: 'UI.Step'.tr,
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                    text: step.toString(),
                    style: Get.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                const TextSpan(text: ' '),
                TextSpan(
                    text: 'UI.Of'.tr,
                    style: Get.textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.bold,fontSize: 10.sp)),
                const TextSpan(text: ' '),
                TextSpan(text: total.toString()),
              ],
              style: Get.textTheme.bodySmall!.copyWith(fontSize: 10.sp),
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

        // if first page show cancel button
        // if (step == 1)
        FadeIn(
          key: const ValueKey('CancelButton'),
          child: TextButton(
            onPressed: FlyStepperController.to.cancel,
            child: Text(
              'Cancel'.tr,
              style: Get.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
