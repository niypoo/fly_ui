import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/multiStepPage.controller.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepBottomHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepSubHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepTitle.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepPrimaryButton.widget.dart';

class FlyMultiStepLandscapeLayout extends StatelessWidget {
  const FlyMultiStepLandscapeLayout({
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
            FlyMultiStepTitle(title: title),

            // HINT
            FlyMultiStepHint(hint: hint),

            // Sub Hint
            FlyMultiStepSubHint(subHint: subHint),
          ],
        ),
      ),
      childB: FlyLandScapeScroll(
        child: Column(
          children: [
            // OPTIONS
            ...children,

            // END HINT
            FlyMultiStepBottomHint(endHint: endHint),

            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (FlyMultiStepPageController.to.step > 1)
                  const FlyMultiStepPreviousButton(),
                const Spacer(),
                FlyMultiStepNextButton(
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
