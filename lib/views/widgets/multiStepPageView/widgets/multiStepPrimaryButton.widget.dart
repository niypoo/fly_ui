import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';

class FluMultiStepPrimaryButton extends StatelessWidget {
  const FluMultiStepPrimaryButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  final String buttonTitle;
  final Function? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: FlyElevatedButton.primary(
        title: buttonTitle,
        onPressed: onTap,
        icon: icon ?? Icons.arrow_forward_ios_rounded,
      ),
    );
  }
}
