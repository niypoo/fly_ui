import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/containers/continerColored.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyContainerAsTextField extends StatelessWidget {
  const FlyContainerAsTextField({
    Key? key,
    this.textColor,
    required this.onChangeValueTap,
    required this.value,
    required this.suffix,
    this.bgColor,
  }) : super(key: key);

  final Color? textColor;
  final Color? bgColor;
  final Function? onChangeValueTap;
  final String value;
  final dynamic suffix;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onChangeValueTap,
      child: FlyContainerColored(
        color: bgColor ?? Get.theme.scaffoldBackgroundColor,
        colorBorder: textColor ?? Get.theme.iconTheme.color!.withOpacity(0.3),
        child: Row(
          children: [
            Expanded(
              child: AutoSizeText(
                value,
                style: Get.textTheme.labelLarge,
              ),
            ),
            if (suffix != null && suffix is Widget)
              suffix
            else if (suffix != null)
              Text(
                suffix,
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
