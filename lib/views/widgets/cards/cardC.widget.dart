import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyCardC extends StatelessWidget {
  const FlyCardC({
    Key? key,
    required this.title,
    required this.value,
    required this.label,
    this.bgColor,
    this.icon,
    this.textColor,
    this.textSpans,
    this.valueTextStyle,
    this.titleTextStyle,
    this.onLongPress,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final String label;
  final dynamic icon;
  final Color? textColor;
  final Color? bgColor;
  final List<TextSpan>? textSpans;
  final TextStyle? valueTextStyle;
  final TextStyle? titleTextStyle;

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
          color: bgColor,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if icon is icon data
                    if (icon != null && icon is IconData)
                      Icon(icon, color: textColor)

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
                          ],
                          style: Get.textTheme.labelSmall!.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        maxLines: 1,
                        maxFontSize: Get.textTheme.titleLarge!.fontSize!,
                        minFontSize: Get.textTheme.titleSmall!.fontSize!,
                      ),
                    ),
                  ],
                ),
              ),

              // values
              AutoSizeText.rich(
                TextSpan(
                  text: title,
                  children: [
                    if (textSpans != null)
                      TextSpan(
                        text: ' ',
                        children: textSpans,
                        style: titleTextStyle ??
                            Get.textTheme.labelSmall!
                                .copyWith(color: textColor),
                      )
                  ],
                ),
                style: titleTextStyle ??
                    Get.textTheme.labelLarge!.copyWith(
                      color: textColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
