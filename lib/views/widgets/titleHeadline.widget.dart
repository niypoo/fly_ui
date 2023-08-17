import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:get/get.dart';

class FlyTitle extends StatelessWidget {
  const FlyTitle({
    Key? key,
    required this.text,
    this.textStyle,
    this.alignment = AlignmentDirectional.centerStart,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final AlignmentDirectional alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AutoSizeText(
        text,
        style: textStyle ?? Get.textTheme.titleLarge,
        textAlign: TextAlign.start,
        maxLines: 1,
      ),
    );
  }
}

class FlyHeadline extends StatelessWidget {
  const FlyHeadline({
    Key? key,
    this.title,
    this.subtitle,
    this.image,
    this.actions,
    this.padding,
  }) : super(key: key);

  final dynamic title;
  final dynamic subtitle;
  final String? image;
  final List<Widget>? actions;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppConfigService.to.space!.m,
            vertical: AppConfigService.to.space!.m,
          ),
      child: Row(
        children: [
          if (image != null)
            Row(
              children: [
                FlyImage(
                  height: 38,
                  width: 38,
                  url: image,
                ),
                SizedBox(width: AppConfigService.to.space!.xs)
              ],
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IF TITLE
                if (title != null)
                  title is Widget
                      ? title
                      : AutoSizeText(
                          title.toUpperCase(),
                          style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),

                // SUBTITLE
                if (subtitle != null)
                  subtitle is String
                      ? AutoSizeText(
                          subtitle,
                          style: Get.textTheme.bodySmall,
                          maxLines: 1,
                        )
                      : subtitle,
              ],
            ),
          ),
          if (actions != null) ...actions!
        ],
      ),
    );
  }
}
