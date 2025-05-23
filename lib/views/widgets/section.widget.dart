import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperNote.widget.dart';
import 'package:get/get.dart';

class FlySection extends StatelessWidget {
  const FlySection({
    super.key,
    required this.child,
    required this.title,
    this.subtitle,
    this.hint,
    this.action,
    this.bottomHint,
    this.leading,
    this.divider = false,
  });

  final Widget child;
  final String title;
  final String? subtitle;
  final String? hint;
  final String? bottomHint;
  final bool divider;
  final Widget? action;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // leading
              if (leading != null)
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 5.sp),
                  child: leading!,
                ),

              // Title
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText( title , style: Get.textTheme.titleMedium),
                    if(subtitle != null)
                    AutoSizeText(subtitle! , style: Get.textTheme.bodySmall,),
                    if(hint != null)
                    AutoSizeText(hint!, style: Get.textTheme.labelSmall,),
                  ],
                ),
              ),

              // Actions
              if (action != null)
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 5.sp),
                  child: action!,
                ),
            ],
          ),

          // Children
          Padding(
            padding: EdgeInsets.only(top: 8.sp),
            child: child,
          ),

          // END HINT
          FlyStepperNote(endHint: bottomHint),

          if (divider)
            Divider(
              color: Get.iconColor!.withOpacity(0.1),
              height: 10.sp,
              indent: 10.sp,
              endIndent: 10.sp,
            ),
        ],
      ),
    );
  }
}
