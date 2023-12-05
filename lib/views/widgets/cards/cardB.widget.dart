import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
    this.textSpans,
    this.onTap,
    this.child,
    this.onLongPress,
  }) : super(key: key);

  final String title;
  final Color? bgColor;
  final Color? textColor;
  final String value;
  final String label;
  final IconData? icon;
  final Widget? child;
  final List<TextSpan>? textSpans;
  final Function? onTap;
  final Function? onLongPress;

  @override
  Widget build(BuildContext context) {
    return FlyAnimatedRandomFade(
      child: FlyInkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: FlyContainer(
          margin: const EdgeInsets.all(0),
          padding: EdgeInsets.symmetric(
            vertical: 5.sp,
            horizontal: 8.sp,
          ),
          color: bgColor,
          radius: 15.sp,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Flexible(
                    child: AutoSizeText(
                      title,
                      style: Get.textTheme.titleMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                    ),
                  ),

                  // Value and label
                  Flexible(
                    child: AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: value,
                            style: Get.textTheme.titleLarge!.copyWith(
                              fontSize: 30.sp,
                              color: textColor,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(text: label),

                          // more textSpans in any case
                          if (textSpans != null) ...textSpans!
                        ],
                        style: Get.textTheme.labelSmall!.copyWith(
                            color: textColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      maxLines: 1,
                    ),
                  ),

                  // Child Widget
                  if (child != null) Flexible(flex: 2, child: child!),
                ],
              ),
              if (icon != null)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Opacity(
                      opacity: 0.2,

                      // if icon is icon data
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            icon,
                            color: textColor,
                            size: 25.sp,
                          ),
                        ],
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
