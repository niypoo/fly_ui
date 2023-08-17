import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/views/widgets/progressBar.widget.dart';
import 'package:get/get.dart';

class FlyMultiStepsProgress extends StatelessWidget {
  const FlyMultiStepsProgress({
    Key? key,
    required this.step,
    required this.total,
    required this.onTapBack,
    required this.onTapCancel,
    this.color,
  }) : super(key: key);

  final int total;
  final int step;
  final Color? color;
  final Function onTapBack;
  final Function onTapCancel;

  @override
  Widget build(BuildContext context) {
    // return widget
    return Row(
      children: [
        // if user move first page show back
        if (step > 1)
          FadeIn(
            key: const ValueKey('BackButton'),
            child: IconButton(
              onPressed: onTapBack as void Function()?,
              icon: const BackButtonIcon(),
            ),
          ),

        // if first page show cancel button
        if (step == 1)
          FadeIn(
            key: const ValueKey('CancelButton'),
            child: TextButton(
              onPressed: onTapCancel as void Function()?,
              child: Text(
                'Cancel'.tr,
                style: Get.textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

        if (step <= (total - 1))
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
