import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:get/get.dart';

class FlyStepperNextButton extends StatelessWidget {
  const FlyStepperNextButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  final String buttonTitle;
  final Function? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: const ValueKey('FlyMultiStepNextButton'),
      child: FlyElevatedButton.primary(
        title: buttonTitle,
        onPressed: onTap,
        icon: icon ?? Icons.arrow_forward_ios_rounded,
        iconAlignment: IconAlignment.end,
      ),
    );
  }
}

class FlyMultiStepPreviousButton extends StatelessWidget {
  const FlyMultiStepPreviousButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyElevatedButton.normal(
      icon: Icons.arrow_back_ios_rounded,
      onPressed: FlyStepperController.to.back,
      title: 'Previous'.tr,
    );
  }
}
