import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperNote.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperSubtitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperHint.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperTitle.widget.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/StepperNextButton.widget.dart';

class FlyStepperPortraitLayout extends StatelessWidget {
  const FlyStepperPortraitLayout({
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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.sp),
                // Title
                // Title
                FlyStepperTitle(title: title),
                SizedBox(height: 2.sp),
                // HINT
                FlyStepperSubtitle(hint: hint),
                // Sub Hint
                FlyStepperHint(subHint: subHint),
                SizedBox(height: 8.sp),

                // Children
                ...children,

                // END HINT
                FlyStepperNote(endHint: endHint),
              ],
            ),
          ),
        ),
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
        SizedBox(height: 5.sp),
      ],
    );
  }
}
