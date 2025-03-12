import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperNote.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperSubtitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperHint.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperTitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/StepperNextButton.widget.dart';

class FlyStepperLandscapeLayout extends StatelessWidget {
  const FlyStepperLandscapeLayout({
    Key? key,
    required this.title,
    required this.children,
    required this.buttonText,
    required this.onTap,
    this.hint,
    this.endHint,
    this.subHint,
    this.buttonIcon,
  }) : super(key: key);

  final String title;
  final String? hint;
  final String? subHint;
  final List<Widget> children;
  final String? endHint;
  final Function? onTap;
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
            FlyStepperSubtitle(hint: hint),

            // Sub Hint
            FlyStepperHint(subHint: subHint),
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
                if (FlyStepperController.to.step > 1)
                  const FlyStepperPreviousButton(),
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
