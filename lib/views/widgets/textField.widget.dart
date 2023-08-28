import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FlyTextField extends StatelessWidget {
  const FlyTextField({
    key,
    this.readOnly = false,
    this.controller,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.validator,
    this.filled,
    this.color,
    this.cursorColor,
    this.borderColor,
    this.textStyle,
    this.maxLines = 1,
    this.maxLength,
    this.alignLabelWithHint = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autoCorrect = false,
    this.padding,
    this.marginTop,
    this.marginBottom,
    this.horizontalContentPadding,
    this.verticalContentPadding,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.suffix,
    this.prefix,
    this.inputFormatters,
    this.focusNode,
    this.height,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.border = InputBorder.none,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function? onFieldSubmitted;
  final Function? onTap;
  final Function? onEditingComplete;
  final Function? onSaved;
  final Function? onChanged;
  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final bool? filled;
  final bool alignLabelWithHint;
  final bool obscureText;
  final bool autoCorrect;
  final bool autoFocus;
  final bool enableSuggestions;
  final Color? color;
  final Color? cursorColor;
  final Color? borderColor;
  final double? padding;
  final double? horizontalContentPadding;
  final double? verticalContentPadding;
  final double? height;
  final double? marginTop;
  final double? marginBottom;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final dynamic prefix;
  final dynamic suffix;

  final InputBorder border;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppConfigService.to.space!.m),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConfigService.to.radius),
        border: Border.all(
          color: borderColor ?? Get.theme.cardColor,
        ),
        color: color,
      ),
      child: Center(
        child: TextFormField(
          autofocus: autoFocus,
          focusNode: focusNode,
          maxLength: maxLength,
          obscureText: obscureText,
          enableSuggestions: obscureText ? false : enableSuggestions,
          autocorrect: obscureText ? false : autoCorrect,
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            alignLabelWithHint: alignLabelWithHint,
            filled: filled,
            border: border,
            labelText: labelText,
            suffixIcon: suffix != null && suffix is Widget
                ? suffix
                : suffix != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConfigService.to.space!.s,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              suffix,
                              style: Get.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
            prefixIcon: prefix != null && prefix is Widget
                ? prefix
                : prefix != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConfigService.to.space!.s,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              prefix,
                              style: Get.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
            suffixStyle: Get.textTheme.bodySmall!.copyWith(
              color: Colors.red,
            ),
            prefixStyle: Get.textTheme.bodySmall!.copyWith(
              color: Colors.red,
            ),
            hintText: hintText,
            hintStyle: textStyle ??
                Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w100),
            // contentPadding: EdgeInsets.symmetric(
            //   vertical: verticalContentPadding ?? AppConfigService.to.space!.xs,
            //   horizontal:
            //       horizontalContentPadding ?? AppConfigService.to.space!.xs,
            // ),
            errorStyle: Get.textTheme.bodySmall!.copyWith(color: Colors.red),
            labelStyle: Get.textTheme.titleSmall,
          ),
          style: textStyle ?? Get.textTheme.titleMedium,
          textAlign: textAlign,
          onFieldSubmitted: onFieldSubmitted as void Function(String)?,
          onChanged: onChanged as void Function(String)?,
          onEditingComplete: onEditingComplete as void Function()?,
          onSaved: onSaved as void Function(String?)?,
          onTap: onTap as void Function()?,
          readOnly: readOnly,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          cursorColor: Colors.amberAccent,
        ),
      ),
    );
  }
}
