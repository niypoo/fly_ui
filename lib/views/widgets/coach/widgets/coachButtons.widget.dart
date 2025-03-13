import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/coach/coach.controller.dart';
import 'package:get/get.dart';

class FlyCoachNextButton extends StatelessWidget {
  const FlyCoachNextButton({
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
        // icon: Icons.arrow_back_ios_rounded,
      ),
    );
  }
}

class FlyCoachPreviousButton extends StatelessWidget {
  const FlyCoachPreviousButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyElevatedButton.normal(
      // icon: Icons.arrow_forward_ios_rounded,
      onPressed: FlyCoachController.to.back,
      title: 'UI.Previous'.tr,
    );
  }
}

class FlyCoachDontShowButton extends StatelessWidget {
  const FlyCoachDontShowButton({
    Key? key,
    this.dontShowAgain,
  }) : super(key: key);

  final Function? dontShowAgain;

  @override
  Widget build(BuildContext context) {
    return FlyElevatedButton.normal(
      icon: Icons.do_disturb_alt_rounded,
      onPressed: dontShowAgain,
      title: "UI.Don't show again".tr,
    );
  }
}
