import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyCardA extends StatelessWidget {
  const FlyCardA({
    Key? key,
    required this.title,
    required this.value,
    required this.label,
    this.bgColor,
    this.icon,
    this.textColor,
    this.textSpans,
    this.valueTextStyle,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final String title;
  final String value;
  final String label;
  final dynamic icon;
  final Color? textColor;
  final Color? bgColor;
  final List<TextSpan>? textSpans;
  final TextStyle? valueTextStyle;
  final Function? onTap;
  final Function? onLongPress;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: FlyInkWell(
        onLongPress: onLongPress,
        onTap: onTap,
        child: FlyContainer(
          margin: const EdgeInsets.all(0),
          padding: EdgeInsets.only(
            top: AppConfigService.to.space!.m,
            bottom: AppConfigService.to.space!.m,
            right: AppConfigService.to.space!.s,
            left: AppConfigService.to.space!.s,
          ),
          color: bgColor,
          child: Column(
            children: [
              // title
              AutoSizeText(
                title,
                style: Get.textTheme.labelLarge!.copyWith(color: textColor),
                maxFontSize: Get.textTheme.titleMedium!.fontSize!,
                minFontSize: Get.textTheme.titleSmall!.fontSize!,
              ),

              // values
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // if icon is icon data
                    if (icon != null && icon is IconData)
                      Icon(icon, color: textColor, size: 20)

                    // if widget
                    else if (icon != null && icon is Widget)
                      icon,

                    // padding
                    if (icon != null)
                      SizedBox(width: AppConfigService.to.space!.xs),

                    // widget
                    Flexible(
                      child: AutoSizeText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: value,
                              style: valueTextStyle ??
                                  Get.textTheme.titleLarge!
                                      .copyWith(color: textColor),
                            ),
                            const TextSpan(text: ' '),
                            TextSpan(text: label),

                            // more textSpans in any case
                            if (textSpans != null) ...textSpans!
                          ],
                          style: Get.textTheme.labelSmall!.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        maxLines: 2,
                        maxFontSize: Get.textTheme.titleLarge!.fontSize!,
                        minFontSize: Get.textTheme.titleSmall!.fontSize!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
