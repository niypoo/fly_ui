import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
    this.filled = true,
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
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.suffix = const [],
    this.prefix = const [],
    this.inputFormatters,
    this.focusNode,
    this.autoFocus = false,
    this.marginBottom = 8,
    this.marginTop = 0,
    this.contentPaddingVertical = 0,
    this.isCollapsed = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
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
  final bool filled;
  final bool alignLabelWithHint;
  final bool obscureText;
  final bool autoCorrect;
  final bool autoFocus;
  final bool isCollapsed;
  final bool enableSuggestions;
  final Color? color;
  final Color? cursorColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<Widget> prefix;
  final List<Widget> suffix;
  final double marginBottom;
  final double marginTop;
  final double contentPaddingVertical;

  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom.sp, top: marginTop.sp),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: borderColor ?? Get.theme.cardColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: borderColor ?? Get.theme.cardColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: borderColor ?? Get.theme.cardColor,
              width: 2.0,
            ),
          ),
          fillColor: color ?? Get.theme.cardColor,
          labelText: labelText,
          isCollapsed: isCollapsed,
          contentPadding: EdgeInsetsDirectional.symmetric(
            horizontal: 10.sp,
            vertical: contentPaddingVertical,
          ),
          suffixIcon: suffix.isEmpty
              ? null
              : Padding(
                  padding: EdgeInsetsDirectional.only(end: 4.sp),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 4.sp,
                    spacing: 4.sp,
                    children: suffix,
                  ),
                ),
          prefixIcon: prefix.isEmpty
              ? null
              : Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: prefix,
                ),
          suffixStyle: Get.textTheme.bodySmall!.copyWith(
            color: Colors.red,
          ),
          prefixStyle: Get.textTheme.bodySmall!.copyWith(
            color: Colors.red,
          ),
          hintText: hintText,
          hintStyle: textStyle ??
              Get.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 12.sp,
              ),
          errorStyle: Get.textTheme.bodySmall!.copyWith(
            color: Colors.red,
            fontSize: 9.sp,
            fontWeight: FontWeight.w300,
          ),
          labelStyle: Get.textTheme.titleSmall!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        style: textStyle ??
            Get.textTheme.titleMedium!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        onFieldSubmitted: onFieldSubmitted as void Function(String)?,
        onChanged: onChanged as void Function(String)?,
        onEditingComplete: onEditingComplete as void Function()?,
        onSaved: onSaved as void Function(String?)?,
        onTap: onTap as void Function()?,
        readOnly: readOnly,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        cursorColor: cursorColor,
      ),
    );
  }
}

class SuffixText extends StatelessWidget {
  const SuffixText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.textTheme.bodyMedium!.copyWith(
        fontSize: 9.sp,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
