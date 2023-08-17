import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyTextButton extends StatelessWidget {
  const FlyTextButton({
    Key? key,
    required this.title,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final String title;
  final Function? onTap;
  final Function? onLongPress;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: AutoSizeText(
        title,
        style: Get.textTheme.titleLarge!.copyWith(
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }
}
