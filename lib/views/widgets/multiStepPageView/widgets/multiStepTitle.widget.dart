import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyMultiStepTitle extends StatelessWidget {
  const FlyMultiStepTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: Get.textTheme.titleLarge,
    );
  }
}
