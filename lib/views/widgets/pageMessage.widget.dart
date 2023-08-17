import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FlyPageMessage extends StatelessWidget {
  const FlyPageMessage({
    Key? key,
    this.image,
    this.subtitle,
    this.title,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConfigService.to.space!.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null)
            Padding(
              padding: EdgeInsets.all(AppConfigService.to.space!.m),
              child: Center(
                child: Image.asset(
                  image!,
                  width: context.width * 0.4,
                  height: context.width * 0.4,
                ),
              ),
            ),
          if (title != null)
            AutoSizeText(
              title!,
              style: Get.textTheme.titleLarge!.copyWith(height: 1),
              textAlign: TextAlign.center,
            ),
          if (subtitle != null)
            AutoSizeText(
              subtitle!,
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
