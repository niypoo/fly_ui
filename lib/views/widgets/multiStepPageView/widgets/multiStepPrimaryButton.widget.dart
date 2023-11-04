import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';

class FluMultiStepPrimaryButton extends StatelessWidget {
  const FluMultiStepPrimaryButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  final String buttonTitle;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.h),
      child: FlyElevatedButton.primary(
        title: buttonTitle,
        onPressed: onTap,
      ),
    );
  }
}
