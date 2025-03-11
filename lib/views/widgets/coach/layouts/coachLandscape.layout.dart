import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';
import 'package:fly_ui/views/widgets/coach/coach.controller.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachButtons.widget.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachHint.widget.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachSubtitle.widget.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachTitle.widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            FlyCoachTitle(title: title),

            // HINT
            FlyCoachSubtitle(hint: description),

            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (dontShowAgain != null)
                  FlyCoachDontShowButton(dontShowAgain: dontShowAgain),
                if (FlyCoachController.to.step > 1)
                  const FlyCoachPreviousButton(),
                const Spacer(),
                FlyCoachNextButton(
                  buttonTitle: buttonText,
                  icon: buttonIcon,
                  onTap: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
      childB: FlyLandScapeScroll(
        child: Column(
          children: [
            // OPTIONS
            ...children,

            // END HINT
            FlyCoachHint(endHint: endHint),
          ],
        ),
      ),
    );
  }
}
