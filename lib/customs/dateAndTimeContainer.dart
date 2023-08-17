import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyDateAndTimeContainer extends StatelessWidget {
  const FlyDateAndTimeContainer({
    Key? key,
    required this.value,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String value;
  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
      child: FlyInkWell(
        onTap: onTap,
        child: FlyContainer(
          margin: const EdgeInsets.all(0),
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText(title, style: Get.textTheme.labelLarge),
              ),
              AutoSizeText(value, style: Get.textTheme.bodyMedium),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
