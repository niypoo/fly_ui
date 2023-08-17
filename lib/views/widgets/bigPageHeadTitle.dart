import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyPageHeadTitle extends StatelessWidget {
  const FlyPageHeadTitle({
    Key? key,
    required this.text,
    this.textStyle,
    this.alignment = AlignmentDirectional.centerStart,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final AlignmentDirectional alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AutoSizeText(
        text,
        style: textStyle ?? Get.textTheme.headlineLarge,
        textAlign: TextAlign.start,
        maxLines: 1,
      ),
    );
  }
}
