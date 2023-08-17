import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyNotFoundData extends StatelessWidget {
  const FlyNotFoundData({
    Key? key,
    this.title,
    this.padding,
  }) : super(key: key);

  final String? title;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? AppConfigService.to.space!.m),
      child: AutoSizeText(title ?? 'No data provided yet.'.tr),
    );
  }
}
