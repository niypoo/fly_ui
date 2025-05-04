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
    this.initialValue,
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
    this.marginBottom = 6,
    this.marginTop = 0,
    this.contentPaddingVertical,
    this.contentPaddingHorizontal,
    this.isCollapsed = true,
    this.decoration,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Function(String?)? onTap;
  final Function(String?)? onEditingComplete;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? initialValue;
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
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<Widget> prefix;
  final List<Widget> suffix;
  final double marginBottom;
  final double marginTop;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final EdgeInsetsGeometry? contentPadding;

  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom.sp, top: marginTop.sp),
      child: TextFormField(
        initialValue: initialValue,
        autofocus: autoFocus,
        focusNode: focusNode,
        maxLength: maxLength,
        obscureText: obscureText,
        enableSuggestions: obscureText ? false : enableSuggestions,
        autocorrect: obscureText ? false : autoCorrect,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        decoration: decoration ??
            flyTextFieldStyle(
              alignLabelWithHint: alignLabelWithHint,
              isCollapsed: isCollapsed,
              filled: filled,
              suffix: suffix,
              prefix: prefix,
              borderColor: borderColor,
              color: color,
              labelText: labelText,
              contentPadding: contentPadding,
              contentPaddingHorizontal: contentPaddingHorizontal,
              contentPaddingVertical: contentPaddingVertical,
              hintText: hintText,
              textStyle: textStyle,
            ),
        style: textStyle ?? Get.textTheme.titleSmall!.copyWith(),
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        onFieldSubmitted: onFieldSubmitted,
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
      style: Get.textTheme.labelMedium!,
    );
  }
}

InputDecoration flyTextFieldStyle({
  bool alignLabelWithHint = false,
  bool isCollapsed = true,
  bool filled = true,
  List<Widget> suffix = const [],
  List<Widget> prefix = const [],
  Color? borderColor,
  Color? color,
  String? labelText,
  EdgeInsetsGeometry? contentPadding,
  double? contentPaddingHorizontal,
  double? contentPaddingVertical,
  String? hintText,
  TextStyle? textStyle,
}) {
  return InputDecoration(
    alignLabelWithHint: alignLabelWithHint,
    filled: filled,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.sp),
      borderSide: BorderSide(
        color: borderColor ?? Get.theme.cardColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.sp),
      borderSide: BorderSide(
        color: borderColor ?? Get.theme.cardColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.sp),
      borderSide: BorderSide(
        color: borderColor ?? Get.theme.cardColor,
        width: 2.0,
      ),
    ),
    fillColor: color ?? Get.theme.scaffoldBackgroundColor,
    labelText: labelText,
    isCollapsed: isCollapsed,
    contentPadding: contentPadding ??
        EdgeInsetsDirectional.symmetric(
          horizontal: contentPaddingHorizontal ?? 16.sp,
          vertical: contentPaddingVertical ?? 16.sp,
        ),
    suffixIcon: suffix.isEmpty
        ? null
        : Padding(
            padding: EdgeInsetsDirectional.only(end: 5.sp, start: 5.sp),
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
    suffixStyle: Get.textTheme.labelMedium!.copyWith(
      color: Colors.red,
    ),
    prefixStyle: Get.textTheme.labelMedium!.copyWith(
      color: Colors.red,
    ),
    hintText: hintText,
    hintStyle: textStyle ??
        Get.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w200),
    errorStyle: Get.textTheme.labelMedium!.copyWith(
      color: Colors.red,
    ),
    labelStyle: Get.textTheme.titleSmall!.copyWith(
      fontSize: 11.sp,
    ),
  );
}
