import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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
      menuScreen: SafeArea(child: menuScreen),
      mainScreen: mainScreen,
      borderRadius: 24.0,
      showShadow: true,
      angle: context.isLandscape ? 0.0 : -12.0,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      slideWidth: (context.isLandscape ? context.height * 1: context.width * 0.7) ,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      menuBackgroundColor: Get.theme.cardColor,
      // shadowLayer1Color: Get.theme.primaryColor.withOpacity(0.1),
      // shadowLayer2Color: Get.theme.colorScheme.secondary.withOpacity(0.1),
      isRtl: isRtl,
    );
  }
}
