import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyListText extends StatelessWidget {
  const FlyListText({
    Key? key,
    required this.title,
    this.onTap,
    this.icon,
    this.color,
  }) : super(key: key);

  final String title;
  final Function? onTap;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: AutoSizeText(
                title,
                style: Get.textTheme.labelLarge!.copyWith(
                    color: color, fontSize: 9.sp, fontWeight: FontWeight.bold),
              )),
              Icon(
                icon ?? Icons.arrow_forward_ios_rounded,
                size: 20,
                color: color,
              ),
            ],
          ),
          Divider(
            color: Get.theme.cardColor,
          )
        ],
      ),
    );
  }
}
