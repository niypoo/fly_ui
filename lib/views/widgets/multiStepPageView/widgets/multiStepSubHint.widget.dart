import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyMultiStepSubHint extends StatelessWidget {
  const FlyMultiStepSubHint({
    Key? key,
    required this.subHint,
  }) : super(key: key);

  final String? subHint;

  @override
  Widget build(BuildContext context) {
    return subHint == null
        ? const SizedBox.shrink()
        : Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppConfigService.to.space!.m),
            child: AutoSizeText(subHint!, style: Get.textTheme.bodyMedium),
          );
  }
}
