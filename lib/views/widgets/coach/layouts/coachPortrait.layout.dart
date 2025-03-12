import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/coach/coach.controller.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachButtons.widget.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachHint.widget.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachSubtitle.widget.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachTitle.widget.dart';
import 'package:patata_responsive/patata_responsive.dart';


class FlyCoachPortraitLayout extends StatelessWidget {
  const FlyCoachPortraitLayout({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
    this.dontShowAgain,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.sp),
                // Children
                ...children,
                // END HINT
                FlyCoachHint(endHint: endHint),
                SizedBox(height: 10.sp),
                // Title
                // Title
                FlyCoachTitle(title: title),
                SizedBox(height: 2.sp),
                // HINT
                FlyCoachSubtitle(hint: description),

      
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
