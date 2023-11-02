import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
    this.actionButton,
  }) : super(key: key);

  final Function? onTap;
  final String? photoUrl;
  final String? displayName;
  final String? id;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          // Image
          Stack(
            children: [

              // image
              Hero(
                tag: 'user-photo-$id',
                child: FlyImage(
                  height: 35.w,
                  width: 27.w,
                  url: photoUrl,
                ),
              ),

              // action button
              if (actionButton != null)
                Positioned(
                  bottom: 5,
                  child: actionButton!,
                )
            ],
          ),

          // Display Name
          Padding(
            padding: EdgeInsets.only(
              top: AppConfigService.to.space!.m,
              bottom: AppConfigService.to.space!.l,
            ),
            child: AutoSizeText(
              displayName ?? 'Guest'.tr,
              style: Get.textTheme.headlineMedium!.copyWith(
                fontSize: 24.sp,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
