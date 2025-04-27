import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlySquareButton extends StatelessWidget {
  const FlySquareButton({
    Key? key,
    required this.title,
    this.icon = UniconsLine.plus,
    this.color,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Color? color;
  final Color? textColor;
  final IconData icon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      child: FlyContainer(
        margin: EdgeInsets.all(2.sp),
        padding: EdgeInsets.all(10.sp),
        color: color ?? Get.theme.cardColor,
        child: Column(
          children: [
            Icon(
              icon,
              color: textColor,
              // size: 25.sp,
            ),
            SizedBox(height: 5.sp),
            AutoSizeText(
              title.tr,
              style: Get.textTheme.labelLarge!.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
