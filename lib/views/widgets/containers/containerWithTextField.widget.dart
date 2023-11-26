import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/services/color.service.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';

class FlyContainerWithTextField extends StatelessWidget {
  const FlyContainerWithTextField({
    Key? key,
    required this.title,
    required this.value,
    this.hint,
    this.trailing,
    this.more,
    this.suffix,
    this.bgColor,
    this.textColor,
    this.image,
    this.enableDivider = false,
    this.onChangeValueTap,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String title;
  final String? hint;
  final String value;
  final Widget? image;
  final Color? bgColor;
  final Color? textColor;
  final Widget? trailing;
  final Widget? more;
  final String? suffix;
  final bool enableDivider;
  final Function? onChangeValueTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: bgColor,
      margin: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              AutoSizeText(
                title,
                style: Get.textTheme.labelLarge!.copyWith(color: textColor),
              ),
            ],
          ),

          if (enableDivider)
            Divider(
              color: Get.textTheme.titleSmall!.color!.withOpacity(0.1),
              height: AppConfigService.to.space!.l,
            ),

          if (image != null) image!,

          if (hint != null)
            AutoSizeText(
              hint!,
              style: Get.textTheme.bodySmall!
                  .copyWith(color: textColor, fontWeight: FontWeight.w400),
            ),

          if (more != null) more!,

          FlyTextField(
            hintText: value,
            color: Get.theme.scaffoldBackgroundColor,
            borderColor: textColor != null
                ? ColorService.colorLight(textColor!)
                : Get.theme.iconTheme.color!.withOpacity(0.3),
            validator: validator,
            controller: controller,
            suffix: [if (suffix != null) SuffixText(text: suffix!)],
          ),

          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
