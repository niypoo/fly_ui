import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/multiStepPage.controller.dart';
import 'package:get/get.dart';

class FlyMultiStepNextButton extends StatelessWidget {
  const FlyMultiStepNextButton({
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
    return FlyElevatedButton.primary(
      title: buttonTitle,
      onPressed: onTap,
      icon: icon ?? Icons.arrow_forward_ios_rounded,
      iconAlignment: IconAlignment.end,
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
      onPressed: FlyMultiStepPageController.to.back,
      title: 'Previous'.tr,
    );
  }
}
