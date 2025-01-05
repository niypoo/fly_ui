
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyChip extends StatelessWidget {
  const FlyChip({
    super.key,
    required this.tag,
    this.onRemove,
    this.avatar,
  });
  final String tag;
  final Widget? avatar;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 5.sp),
      child: Chip(
        onDeleted: onRemove,
        deleteIcon: Icon(
          UniconsLine.times,
          size: 15.sp,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        padding: EdgeInsets.all(4.sp),
        backgroundColor: Get.theme.cardColor,
        labelPadding: EdgeInsets.symmetric(horizontal: 2.sp),
        avatar: avatar,
        label: Text(
          tag,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ), //Text
      ),
    );
  }
}
