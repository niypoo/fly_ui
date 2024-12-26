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
    this.maxLines = 2,
  }) : super(key: key);

  final String title;
  final String? hint;
  final String value;
  final int maxLines;
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
      margin: EdgeInsets.only(bottom: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              AutoSizeText(
                title,
                style: Get.textTheme.labelLarge!.copyWith(
                  color: textColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          if (enableDivider)
            Divider(
              color: Get.theme.scaffoldBackgroundColor.withOpacity(0.4),
              height: 15.sp,
            ),

          if (image != null) image!,

          if (hint != null)
            AutoSizeText(
              hint!,
              style: Get.textTheme.bodySmall!
                  .copyWith(color: textColor, fontWeight: FontWeight.w400),
            ),

          if (more != null) more!,

          Padding(
            padding: EdgeInsets.only(top: 5.sp),
            child: FlyTextField(
              maxLines: maxLines,
              contentPaddingVertical: 10.sp,
              hintText: value,
              color: bgColor,
              borderColor:
                  bgColor != null ? ColorService.colorDarken(bgColor!) : null,
              validator: validator,
              controller: controller,
              suffix: [if (suffix != null) SuffixText(text: suffix!)],
            ),
          ),

          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
