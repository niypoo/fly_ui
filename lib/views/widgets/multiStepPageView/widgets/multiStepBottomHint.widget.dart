import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyMultiStepBottomHint extends StatelessWidget {
  const FlyMultiStepBottomHint({
    Key? key,
    required this.endHint,
  }) : super(key: key);

  final String? endHint;

  @override
  Widget build(BuildContext context) {
    return endHint == null
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
            child: Center(
              child: AutoSizeText(
                endHint!,
                style: Get.textTheme.bodySmall!.copyWith(
                  fontSize: 7.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
