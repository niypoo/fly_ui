import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/coach/coach.controller.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachButtons.widget.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperNote.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperSubtitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperTitle.widget.dart';

class FlyCoachPortraitLayout extends StatelessWidget {
  const FlyCoachPortraitLayout({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
    required this.dontShowAgain,
    required this.children,
    this.endHint,
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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.sp),
                // Children
                ...children,
                // END HINT
                FlyStepperNote(endHint: endHint),
                SizedBox(height: 10.sp),
                // Title
                // Title
                FlyStepperTitle(title: title),
                SizedBox(height: 2.sp),
                // HINT
                FlyStepperSubtitle(hint: description),

      
              ],
            ),
          ),
        ),
        // BUTTONS
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (dontShowAgain != null)
              FlyCoachDontShowButton(dontShowAgain: dontShowAgain),
            if (FlyCoachController.to.step > 1) const FlyCoachPreviousButton(),
            const Spacer(),
            FlyCoachNextButton(
              buttonTitle: buttonText,
              icon: buttonIcon,
              onTap: onTap,
            ),
          ],
        ),
        SizedBox(height: 5.sp),
      ],
    );
  }
}
