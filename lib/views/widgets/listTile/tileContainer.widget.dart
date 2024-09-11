import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyListTileContainer extends StatelessWidget {
  const FlyListTileContainer({
    Key? key,
    required this.title,
    this.value,
    this.onTap,
    this.trailing,
    this.leading,
  }) : super(key: key);

  final String title;
  final String? value;
  final Widget? trailing;
  final Widget? leading;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      padding: const EdgeInsets.all(0),
      child: ListTile(
        onTap: onTap as void Function()?,
        title: Text(
          title.toUpperCase(),
          style: Get.textTheme.labelLarge!.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: leading,
        subtitle: value != null
            ? Text(
                value!,
                style: Get.textTheme.bodySmall!.copyWith(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w300,
                ),
              )
            : null,
        trailing: trailing,
      ),
    );
  }
}
