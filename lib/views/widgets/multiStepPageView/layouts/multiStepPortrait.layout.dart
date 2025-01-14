import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/multiStepPage.controller.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepBottomHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepSubHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepTitle.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepPrimaryButton.widget.dart';

class FlyMultiStepPortraitLayout extends StatelessWidget {
  const FlyMultiStepPortraitLayout({
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
                FlyMultiStepTitle(title: title),
                SizedBox(height: 2.sp),
                // HINT
                FlyMultiStepHint(hint: hint),
                // Sub Hint
                FlyMultiStepSubHint(subHint: subHint),
                SizedBox(height: 8.sp),

                // Children
                ...children,

                // END HINT
                FlyMultiStepBottomHint(endHint: endHint),
              ],
            ),
          ),
        ),
        // BUTTONS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (FlyMultiStepPageController.to.step > 1)
              const FlyMultiStepPreviousButton(),
            
            
            FlyMultiStepNextButton(
              buttonTitle: buttonText,
              icon: buttonIcon,
              onTap: onTap,
            ),
          ],
        ),
      ],
    );
  }
}
