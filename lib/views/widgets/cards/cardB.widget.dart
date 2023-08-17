import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyCardB extends StatelessWidget {
  const FlyCardB({
    Key? key,
    required this.title,
    this.bgColor,
    this.textColor,
    required this.value,
    required this.label,
    this.icon,
    this.radius,
    this.textSpans,
    this.valueTextStyle,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final String title;
  final Color? bgColor;
  final Color? textColor;
  final String value;
  final String label;
  final dynamic icon;
  final double? radius;
  final List<TextSpan>? textSpans;
  final Function? onTap;
  final Function? onLongPress;
  final TextStyle? valueTextStyle;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: FlyInkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: FlyContainer(
          margin: const EdgeInsets.all(0),
          padding: EdgeInsets.only(
            top: AppConfigService.to.space!.m,
            bottom: AppConfigService.to.space!.m,
            right: AppConfigService.to.space!.s,
            left: AppConfigService.to.space!.s,
          ),
          color: bgColor,
          radius: radius ?? AppConfigService.to.radius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        title,
                        style: Get.textTheme.labelLarge!.copyWith(
                          color: textColor,
                        ),
                        maxLines: 2,
                      ),
                    ),

                    // if icon is icon data
                    if (icon != null && icon is IconData)
                      Icon(
                        icon,
                        color: textColor,
                        size: 20,
                      )

                    // if widget
                    else if (icon != null && icon is Widget)
                      icon,
                  ],
                ),
              ),
              Expanded(
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: valueTextStyle ??
                            Get.textTheme.titleLarge!.copyWith(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(text: label),

                      // more textSpans in any case
                      if (textSpans != null) ...textSpans!
                    ],
                    style: Get.textTheme.labelSmall!
                        .copyWith(color: textColor, fontSize: 11),
                  ),
                  maxLines: 2,
                  maxFontSize: Get.textTheme.titleLarge!.fontSize!,
                  minFontSize: Get.textTheme.titleSmall!.fontSize!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
