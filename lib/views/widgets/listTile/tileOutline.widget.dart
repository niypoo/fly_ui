import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/containerOutline.widget.dart';
import 'package:get/get.dart';

class FlyListTileOutline extends StatelessWidget {
  const FlyListTileOutline({
    Key? key,
    required this.title,
    required this.value,
    this.onTap,
    this.trailing,
    this.suffix,
  }) : super(key: key);

  final String title;
  final Widget? trailing;
  final String value;
  final Function? onTap;
  final String? suffix;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: FlyContainerOutline(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.sp),
                    child: Text(
                      title.toUpperCase(),
                      style: Get.textTheme.labelLarge,
                    ),
                  ),
                  Text(
                    '$value ${suffix ?? ''}',
                    style: Get.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing!
          ],
        ),
      ),
    );
  }
}
