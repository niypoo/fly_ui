import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/coach/layouts/coachLandscape.layout.dart';
import 'package:fly_ui/views/widgets/coach/layouts/coachPortrait.layout.dart';
import 'package:get/get.dart';

class FlyCoachScreen extends StatelessWidget {
  const FlyCoachScreen({
    super.key,
    required this.children,
    required this.onTap,
    required this.buttonText,
    required this.title,
    required this.description,
    this.buttonIcon,
    this.dontShowAgain,
    this.endHint,
  });

  final List<Widget> children;
  final String buttonText;
  final Function onTap;
  final Function? dontShowAgain;
  final String title;
  final String description;
  final String? endHint;
  final IconData? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return context.isLandscape
        ? FlyCoachLandscapeLayout(
            title: title,
            description: description,
            endHint: endHint,
            buttonText: buttonText,
            buttonIcon: buttonIcon,
            onTap: onTap,
            dontShowAgain: dontShowAgain,
            children: children,
          )
        : FlyCoachPortraitLayout(
            title: title,
            description: description,
            endHint: endHint,
            buttonText: buttonText,
            buttonIcon: buttonIcon,
            onTap: onTap,
            dontShowAgain: dontShowAgain,
            children: children,
          );
  }
}
