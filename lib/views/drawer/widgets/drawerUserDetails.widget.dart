import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyDrawerUserDetails extends StatelessWidget {
  const FlyDrawerUserDetails({
    super.key,
    this.onTap,
    this.photoUrl,
    this.displayName,
    this.slug,
    this.id,
    this.actionButton,
  });

  final Function? onTap;
  final String? photoUrl;
  final String? displayName;
  final String? slug;
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
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: actionButton!,
                  ),
                )
            ],
          ),

          SizedBox(
            height: 5.sp,
          ),

          // slug
          if (slug != null)
            AutoSizeText(
              slug!,
              style: Get.textTheme.labelSmall!.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w100,
              ),
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
