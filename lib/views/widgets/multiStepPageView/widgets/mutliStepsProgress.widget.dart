import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/multiStepPage.controller.dart';
import 'package:fly_ui/views/widgets/progressBar.widget.dart';
import 'package:get/get.dart';

class FlyMultiStepsProgress extends StatelessWidget {
  const FlyMultiStepsProgress({
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
            onPressed: FlyMultiStepPageController.to.cancel,
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
