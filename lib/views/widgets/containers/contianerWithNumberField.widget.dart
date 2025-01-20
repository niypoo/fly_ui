import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/containers/containerAsTextField.widget.dart';
import 'package:get/get.dart';

class FlyContainerWithNumberField extends StatelessWidget {
  const FlyContainerWithNumberField({
    Key? key,
    this.title,
    required this.value,
    required this.onChangeValueTap,
    this.hint,
    this.enableDivider = false,
    this.trailing,
    this.suffix,
    this.bgColor,
    this.textColor,
    this.image,
    this.checkbox,
  }) : super(key: key);

  final String? title;
  final Widget? checkbox;
  final dynamic hint;
  final bool enableDivider;
  final String value;
  final Widget? image;
  final Color? bgColor;
  final Color? textColor;
  final Widget? trailing;
  final dynamic suffix;
  final Function onChangeValueTap;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: bgColor ?? Get.theme.cardColor,
      margin: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (checkbox != null) checkbox!,
              if (title != null)
                Expanded(
                  child: AutoSizeText(
                    title!,
                    style: Get.textTheme.labelLarge!.copyWith(
                      color: textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          ),

          if (enableDivider)
            Divider(
              color: Get.theme.scaffoldBackgroundColor.withOpacity(0.4),
              height: 15.sp,
            ),

          if (image != null) image!,

          // hint if STRING OR Widget
          if (hint != null && hint is String)
            AutoSizeText(
              hint,
              style: Get.textTheme.bodySmall!.copyWith(
                color: textColor,
              ),
            )
          else if (hint != null && hint is Widget)
            hint,

          Padding(
            padding: EdgeInsets.only(top: 5.sp),
            child: FlyContainerAsTextField(
              textColor: textColor,
              onChangeValueTap: onChangeValueTap,
              value: value,
              suffix: suffix,
            ),
          ),

          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
