import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';
import 'package:launch_url_helper/launchURL.service.dart';

class FlyDrawerDeveloperWatermark extends StatelessWidget {
  const FlyDrawerDeveloperWatermark({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: FlyInkWell(
        onTap: () => LaunchUrlHelper.toUrl('https://mahmoudnabhan.com/'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Developed by'.tr,
              style: Get.textTheme.labelMedium!.copyWith(
                  color: Get.textTheme.labelSmall!.color!.withOpacity(0.3)),
              textAlign: TextAlign.start,
            ),
            Text(
              'Mahmoud Nabhan'.tr,
              style: Get.textTheme.titleMedium!.copyWith(
                  height: 1.2,
                  color: Get.textTheme.labelSmall!.color!.withOpacity(0.3)),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
