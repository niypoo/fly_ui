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
    this.suffix,
    this.prefix,
    this.inputFormatters,
    this.focusNode,
    this.autoFocus = false,
    this.marginBottom = 8,
    this.marginTop = 0,
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
  final bool enableSuggestions;
  final Color? color;
  final Color? cursorColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final dynamic prefix;
  final dynamic suffix;
  final double marginBottom;
  final double marginTop;

  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom.sp,  top: marginTop.sp),
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
          contentPadding: EdgeInsetsDirectional.all(10.sp),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (suffix == null)
                  const SizedBox.shrink()
                else if (suffix is Widget)
                  suffix
                else if (suffix is String)
                  Text(
                    suffix,
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefix == null)
                  const SizedBox.shrink()
                else if (prefix is Widget)
                  prefix
                else if (prefix is String)
                  Text(
                    prefix,
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
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
                fontWeight: FontWeight.w100,
                fontSize: 10.sp,
              ),
          errorStyle: Get.textTheme.bodySmall!.copyWith(
            color: Colors.red,
            fontSize: 10.sp,
            fontWeight: FontWeight.w100,
          ),
          labelStyle: Get.textTheme.titleSmall!.copyWith(
            fontSize: 10.sp,
            fontWeight: FontWeight.w200,
          ),
        ),
        style: textStyle ??
            Get.textTheme.titleMedium!.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
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
