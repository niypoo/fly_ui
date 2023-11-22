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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          Stack(
            children: [
              // image
              Hero(
                tag: 'user-photo-$id',
                child: FlyImage(
                  height: 130.sp,
                  width: 90.sp,
                  url: photoUrl,
                ),
              ),

              // action button
              if (actionButton != null)
                Positioned(
                  bottom: 0,
                  child: actionButton!,
                )
            ],
          ),

          // Display Name
          AutoSizeText(
            displayName ?? 'Guest'.tr,
            style: Get.textTheme.headlineMedium!.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
