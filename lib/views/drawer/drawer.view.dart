import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:get/get.dart';

class FlyDrawerView extends GetView<FlyDrawerController> {
  final Widget mainScreen;
  final Widget menuScreen;
  final bool isRtl;

  const FlyDrawerView({
    Key? key,
    required this.mainScreen,
    required this.menuScreen,
    this.isRtl = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: controller.zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: menuScreen,
      mainScreen: mainScreen,
      borderRadius: 10.sp,
      showShadow: true,
      angle: context.isLandscape ? 0.0 : -7.0,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      slideWidth: context.isLandscape ? 90.w : 70.w,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      menuBackgroundColor: Get.theme.cardColor,
      shadowLayer1Color: Get.theme.scaffoldBackgroundColor.withOpacity(0.4),
      shadowLayer2Color: Get.theme.scaffoldBackgroundColor.withOpacity(0.5),
      isRtl: isRtl,
    );
  }
}
