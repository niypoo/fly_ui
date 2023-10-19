import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyDrawerUserDetails extends StatelessWidget {
  const FlyDrawerUserDetails({
    Key? key,
    this.onTap,
     this.photoUrl,
     this.displayName,
     this.id,
  }) : super(key: key);

  final Function? onTap;
  final String? photoUrl;
  final String? displayName;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Hero(
            tag: 'drawer-user-image-${id ?? '100'}',
            child: FlyImage(
              height: 120,
              width: 100,
              url: photoUrl,
            ),
          ),

          // Display Name
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppConfigService.to.space!.xl,
            ),
            child: AutoSizeText(
              displayName ?? 'Guest'.tr,
              style: Get.textTheme.titleLarge,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
