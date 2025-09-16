import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:get/get.dart';

class FlyDrawerView extends GetView<FlyDrawerController> {
  final Widget mainScreen;
  final Widget menuScreen;
  final bool isRtl;
  final DrawerStyle? style;
  final double? slideWidth;
  final double? slideHeight;
  final double? mainScreenScale;
  final double? borderRadius;
  final double? angle;
  final Color? drawerShadowsBackgroundColor;
  final bool? showShadow;
  final Curve? openCurve;
  final Curve? closeCurve;
  final Color? mainScreenOverlayColor;
  final BlendMode? overlayBlend;
  final List<BoxShadow>? boxShadow;
  final double? overlayBlur;
  final bool? shrinkMainScreen;
  final DrawerStyleBuilder? drawerStyleBuilder;

  const FlyDrawerView({
    Key? key,
    required this.mainScreen,
    required this.menuScreen,
    this.isRtl = false,
    this.style,
    this.slideWidth,
    this.slideHeight,
    this.mainScreenScale,
    this.borderRadius,
    this.angle,
    this.drawerShadowsBackgroundColor,
    this.showShadow,
    this.openCurve,
    this.closeCurve,
    this.mainScreenOverlayColor,
    this.overlayBlend,
    this.boxShadow,
    this.overlayBlur,
    this.shrinkMainScreen,
    this.drawerStyleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: controller.zoomDrawerController,
      style: style ?? DrawerStyle.defaultStyle,
      menuScreen: menuScreen,
      mainScreen: mainScreen,
      slideWidth: slideWidth ?? (context.isLandscape ? 50.w : 70.w),
      slideHeight: slideHeight ?? 0.0,
      mainScreenScale: mainScreenScale ?? 0.3,
      borderRadius: borderRadius ?? 10.sp,
      angle: angle ?? (context.isLandscape ? 0.0 : -7.0),
      drawerShadowsBackgroundColor: drawerShadowsBackgroundColor ?? Colors.grey[300]!,
      showShadow: showShadow ?? true,
      openCurve: openCurve ?? Curves.fastOutSlowIn,
      closeCurve: closeCurve ?? Curves.bounceIn,
      mainScreenOverlayColor: mainScreenOverlayColor,
      overlayBlend: overlayBlend ?? BlendMode.screen,
      boxShadow: boxShadow,
      overlayBlur: overlayBlur ?? 0.0,
      shrinkMainScreen: shrinkMainScreen ?? false,
      drawerStyleBuilder: drawerStyleBuilder,
      menuBackgroundColor: Get.theme.cardColor,
      shadowLayer1Color: Get.theme.scaffoldBackgroundColor.withOpacity(0.4),
      shadowLayer2Color: Get.theme.scaffoldBackgroundColor.withOpacity(0.5),
      isRtl: isRtl,
    );
  }
}
