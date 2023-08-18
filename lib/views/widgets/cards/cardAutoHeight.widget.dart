import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/animations/animatedRandomFade.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyCardAutoHeight extends StatelessWidget {
  const FlyCardAutoHeight({
    Key? key,
    required this.title,
    required this.value,
    required this.label,
    this.bgColor,
    this.icon,
    this.textColor,
    this.textSpans,
    this.labelTextStyle,
    this.titleTextStyle,
    this.valueTextStyle,
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
  final TextStyle? labelTextStyle;
  final TextStyle? valueTextStyle;
  final TextStyle? titleTextStyle;

  final Function? onLongPress;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: FlyInkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: FlyContainer(
          margin: const EdgeInsets.all(0),
          color: bgColor,
          child: Column(
            children: [
              // title
              AutoSizeText(
                title,
                style: titleTextStyle ??
                    Get.textTheme.labelLarge!.copyWith(color: textColor),
                maxLines: 1,
              ),

              // padding
              SizedBox(height: AppConfigService.to.space!.s),

              // values
              Row(
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
                          TextSpan(text: ' '),
                          TextSpan(text: label, style: labelTextStyle),

                          // more textSpans in any case
                          if (textSpans != null) ...textSpans!
                        ],
                        style: Get.textTheme.labelSmall!.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
