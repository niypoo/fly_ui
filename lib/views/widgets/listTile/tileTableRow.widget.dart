import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/tableRow.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyListTitleTableRow extends StatelessWidget {
  const FlyListTitleTableRow({
    Key? key,
    required this.date,
    required this.value,
    required this.title,
    this.note,
    this.color,
    this.onMoreActions,
  }) : super(key: key);

  final String title;
  final String date;
  final dynamic value;
  final Color? color;
  final String? note;
  final Function? onMoreActions;

  @override
  Widget build(BuildContext context) {
    return FlyTableRow(
      bottomHint: note != null
          ? AutoSizeText(
              note!,
              maxLines: 2,
              style: Get.textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          : null,
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: Get.textTheme.bodyMedium,
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
              style: Get.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.w700, color: color),
              textAlign: TextAlign.center,
            ),
          ),

        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConfigService.to.space!.s),
          child: AutoSizeText(
            date,
            maxLines: 1,
            style: Get.textTheme.bodySmall!.copyWith(color: color),
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
            icon: const Icon(
              UniconsLine.ellipsis_v,
              size: 20,
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
      height: AppConfigService.to.space!.m,
      width: 5,
      child: VerticalDivider(
        color: Get.iconColor!.withOpacity(0.1),
      ),
    );
  }
}
