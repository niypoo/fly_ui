import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperNote.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperSubtitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperTitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/StepperNextButton.widget.dart';
import 'package:get/get.dart';

class FlyCoachLandscapeLayout extends StatelessWidget {
  const FlyCoachLandscapeLayout({
    Key? key,
    required this.title,
    required this.children,
    required this.buttonText,
    required this.onTap,
    required this.description,
    this.endHint,
    this.dontShowAgain,
    this.buttonIcon,
  }) : super(key: key);

  final String title;
  final String description;
  final List<Widget> children;
  final String? endHint;
  final Function? onTap;
  final Function? dontShowAgain;
  final String buttonText;
  final IconData? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return FlyLandscapeView(
      childA: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            FlyStepperTitle(title: title),

            // HINT
            FlyStepperSubtitle(hint: description),
          ],
        ),
      ),
      childB: FlyLandScapeScroll(
        child: Column(
          children: [
            // OPTIONS
            ...children,

            // END HINT
            FlyStepperNote(endHint: endHint),

            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (dontShowAgain != null)
                  FlyElevatedButton.normal(
                    icon: Icons.do_disturb_alt_rounded,
                    onPressed: dontShowAgain,
                    title: "UI.Don't show again".tr,
                  ),
                if (FlyStepperController.to.step > 1)
                  const FlyMultiStepPreviousButton(),
                const Spacer(),
                FlyStepperNextButton(
                  buttonTitle: buttonText,
                  icon: buttonIcon,
                  onTap: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
