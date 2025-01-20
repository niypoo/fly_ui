import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyLandscapeDivider extends StatelessWidget {
  const FlyLandscapeDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 8.sph,
        height: 70.h,
        child: VerticalDivider(
          color: Get.theme.cardColor,
          thickness: 1,
        ),
      ),
    );
  }
}
