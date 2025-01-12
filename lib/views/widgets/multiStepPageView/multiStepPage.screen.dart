import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/layouts/multiStepPortrait.layout.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/layouts/multiStepLandscape.layout.dart';
import 'package:get/get.dart';

class FlyMultiStepScreenView extends StatelessWidget {
  const FlyMultiStepScreenView({
    Key? key,
    required this.children,
    required this.onTap,
    required this.buttonText,
    required this.title,
    this.hint,
    this.buttonIcon,
    this.subHint,
    this.endHint,
  }) : super(key: key);

  final List<Widget> children;
  final String buttonText;
  final Function onTap;
  final String title;
  final String? hint;
  final String? subHint;
  final String? endHint;
  final IconData? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return context.isLandscape
        ? FlyMultiStepLandscapeLayout(
            title: title,
            hint: hint,
            subHint: subHint,
            endHint: endHint,
            buttonText: buttonText,
            buttonIcon: buttonIcon,
            onTap: onTap,
            children: children,
          )
        : FlyMultiStepPortraitLayout(
            title: title,
            hint: hint,
            subHint: subHint,
            endHint: endHint,
            buttonText: buttonText,
            buttonIcon: buttonIcon,
            onTap: onTap,
            children: children,
          );
  }
}
