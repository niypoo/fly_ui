import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyPageHeadTitle extends StatelessWidget {
  const FlyPageHeadTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return  AutoSizeText(
        text,
        style: Get.textTheme.titleLarge,
        textAlign: TextAlign.start,
        maxLines: 1,
      
    );
  }
}

class FlyListHeadTitle extends StatelessWidget {
  const FlyListHeadTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return  AutoSizeText(
        text,
        style: Get.textTheme.titleMedium,
        textAlign: TextAlign.start,
        maxLines: 1,
      
    );
  }
}
