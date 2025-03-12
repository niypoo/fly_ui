import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:get/get.dart';
import 'package:localization_service/localization.service.dart';

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
        icon: icon ?? (LocalizationService.to.isRTL  ? Icons.arrow_back_ios_rounded: Icons.arrow_forward_ios_rounded),
        iconAlignment: LocalizationService.to.isRTL ? IconAlignment.start : IconAlignment.end,
      ),
    );
  }
}

class FlyStepperPreviousButton extends StatelessWidget {
  const FlyStepperPreviousButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyElevatedButton.normal(
      iconAlignment: LocalizationService.to.isRTL ? IconAlignment.start : IconAlignment.end,
      icon: LocalizationService.to.isRTL  ? Icons.arrow_forward_ios_rounded: Icons.arrow_back_ios_rounded,
      onPressed: FlyStepperController.to.back,
      title: 'UI.Previous'.tr,
    );
  }
}