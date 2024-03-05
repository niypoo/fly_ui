import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyReminderCard extends StatelessWidget {
  const FlyReminderCard({
    Key? key,
    required this.title,
    this.icon,
    this.actions,
    this.details,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final List<Widget>? actions;
  final List<Widget>? details;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      margin: EdgeInsets.only(bottom: 6.sp),
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
              if (actions != null) Row(children: actions!),
            ],
          ),

          if (details != null)
            Divider(
              color: Get.theme.iconTheme.color!.withOpacity(0.2),
              height: 10.sp,
              indent: 5.sp,
              endIndent: 5.sp,
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
