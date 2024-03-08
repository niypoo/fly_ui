import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepBottomHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepSubHint.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepTitle.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/multiStepPrimaryButton.widget.dart';

class FlyMultiStepLandscapeLayout extends StatelessWidget {
  const FlyMultiStepLandscapeLayout({
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
      childB: SingleChildScrollView(
        child: Column(
          children: [
            // top Paddding
            const SizedBox(height: 58),

            // OPTIONS
            ...children,

            // END HINT
            FlyMultiStepBottomHint(endHint: endHint),

            // BUTTONS
            FluMultiStepPrimaryButton(buttonTitle: buttonTitle, onTap: onTap!),
          ],
        ),
      ),
    );
  }
}
