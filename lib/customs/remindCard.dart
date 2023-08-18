import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyReminderCard extends StatelessWidget {
  const FlyReminderCard({
    Key? key,
    required this.title,
    this.icon,
    this.onOptionTap,
    this.details,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final Function? onOptionTap;
  final List<Widget>? details;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      child: Column(
        children: [
          // title
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // ICON WITH PADDING
                    if (icon != null) Icon(icon),
                    if (icon != null)
                      SizedBox(width: AppConfigService.to.space!.xxs),

                    // TITLE
                    Expanded(
                      child: AutoSizeText(
                        title,
                        style: Get.textTheme.labelLarge,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),

              // OPTIONS BUTTON
              FlyIconButton(
                onPressed: onOptionTap,
                icon: UniconsLine.trash,
                color: Get.theme.iconTheme.color,
                padding: const EdgeInsets.all(0),
              )
            ],
          ),

          if (details != null)
            Divider(
              color: Get.iconColor!.withOpacity(0.2),
              height: AppConfigService.to.space!.l,
              indent: 10,
              endIndent: 10,
            ),

          // DETAILS
          if (details != null)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConfigService.to.space!.xs),
              child: Column(children: details!),
            )
        ],
      ),
    );
  }
}

class ReminderCardDetail extends StatelessWidget {
  const ReminderCardDetail({
    Key? key,
    required this.label,
    this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          '$label : ',
          style: Get.textTheme.bodyLarge,
        ),
        Expanded(
          child: AutoSizeText(
            value ?? ' ',
            style: Get.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
