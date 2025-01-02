import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/tableRow.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyListTitleTableRow extends StatelessWidget {
  const FlyListTitleTableRow({
    Key? key,
    required this.date,
    required this.value,
    required this.title,
    this.subtitle,
    this.note,
    this.color,
    this.onMoreActions,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String date;
  final dynamic value;
  final Color? color;
  final String? note;
  final Function? onMoreActions;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return FlyTableRow(
      onTap: onTap,
      bottomHint: note != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null && subtitle!.isNotEmpty)
                  AutoSizeText(
                    subtitle!,
                    maxLines: 2,
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (note != null && note!.isNotEmpty)
                  AutoSizeText(
                    note!,
                    maxLines: 2,
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
              ],
            )
          : null,
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: Get.textTheme.bodyLarge!.copyWith(
              fontSize: 9.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // divider
        if (value != null) const FlyListTitleLogDivider(),

        // Value with label
        if (value != null && value is! Widget)
          Expanded(
            child: AutoSizeText(
              value ?? '',
              maxLines: 2,
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: 9.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),

        const FlyListTitleLogDivider(),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: AutoSizeText(
            date,
            maxLines: 1,
            style: Get.textTheme.bodySmall!.copyWith(
              fontSize: 9.sp,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // divider
        if (onMoreActions != null) const FlyListTitleLogDivider(),

        // on More Tap
        if (onMoreActions != null)
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(0),
            onPressed: onMoreActions as void Function()?,
            icon: Icon(
              UniconsLine.ellipsis_v,
              size: 16.sp,
            ),
          )
      ],
    );
  }
}

class FlyListTitleLogDivider extends StatelessWidget {
  const FlyListTitleLogDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.sp,
      width: 8.sp,
      child: VerticalDivider(
        color: Get.iconColor!.withOpacity(0.1),
      ),
    );
  }
}
