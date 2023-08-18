import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyLandscapeDivider extends StatelessWidget {
  const FlyLandscapeDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.isTablet
            ? (context.height * 0.06)
            : AppConfigService.to.space!.m,
        height: context.height * 0.7,
        child: VerticalDivider(color: Get.theme.cardColor),
      ),
    );
  }
}
