import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepBottomHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepSubHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepTitle.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepPrimaryButton.widget.dart';

class FlyMultiStepPortraitLayout extends StatelessWidget {
  const FlyMultiStepPortraitLayout({
    Key? key,
    required this.title,
    required this.hint,
    required this.children,
    required this.endHint,
    required this.buttonTitle,
    required this.onTap,
    this.subHint,
  }) : super(key: key);

  final String title;
  final String? hint;
  final String? subHint;
  final List<Widget> children;
  final String? endHint;
  final String buttonTitle;
  final Function? onTap;

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
                SizedBox(height: 10.sp),
                // HINT
                FlyMultiStepHint(hint: hint),
                SizedBox(height: 5.sp),
                // Sub Hint
                FlyMultiStepSubHint(subHint: subHint),

                SizedBox(height: 10.sp),

                ...children,
                // END HINT
                FlyMultiStepBottomHint(endHint: endHint),
              ],
            ),
          ),
        ),
        // BUTTONS
        FluMultiStepPrimaryButton(buttonTitle: buttonTitle, onTap: onTap),
      ],
    );
  }
}
