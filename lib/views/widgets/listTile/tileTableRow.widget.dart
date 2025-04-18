import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
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
                    style: Get.textTheme.bodySmall,
                  ),
                if (note != null && note!.isNotEmpty)
                  AutoSizeText(
                    note!,
                    maxLines: 2,
                    style: Get.textTheme.labelMedium,
                  ),
              ],
            )
          : null,
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: Get.textTheme.titleSmall,
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
              style: Get.textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ),

        const FlyListTitleLogDivider(),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: AutoSizeText(
            date,
            maxLines: 1,
            style: Get.textTheme.bodyLarge,
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
      height: 20.sp,
      width: 10.sp,
      child: VerticalDivider(
        color: Get.iconColor!.withValues(alpha: 0.1),
      ),
    );
  }
}
