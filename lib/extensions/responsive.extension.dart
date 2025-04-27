import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

extension Responsive on num {
  bool get isLandscape => Get.context!.isLandscape;
  bool get isTablet => Get.context!.isTablet;
  double get screeWidth => Get.width;
  double get screenHeight => Get.height;
  double get devicePixelRatio => isTablet ? 13.68 : 9.5076;

  /// Calculates the height depending on the device's screen size
  double get h => this * screenHeight / 100;

  /// Calculates the width depending on the device's screen size
  double get w => this * screeWidth / 100;

  ///Calculates the sp (Scalable Pixel Half Screen) depending on the device's screen size
  ///This is useful in cas you split screen in landscape mode
  double get sph => isLandscape ? (this).sp * 0.5 : (this).sp;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * getScalingFactor();

  double getScalingFactor() {
    double screenWidth = View.of(Get.context!).physicalSize.width;
    if (screenWidth <= 360) {
      return 1.0;
    } else if (screenWidth > 360 && screenWidth <= 411) {
      return 1.2;
    } else if (screenWidth > 411 && screenWidth <= 480) {
      return 1.4;
    } else if (screenWidth > 480 && screenWidth <= 540) {
      return 1.6;
    } else if (screenWidth > 540 && screenWidth <= 600) {
      return 1.8;
    } else if (screenWidth > 600 && screenWidth <= 720) {
      return 2.0;
    } else if (screenWidth > 720 && screenWidth <= 1080) {
      return 2.5;
    } else if (screenWidth > 1080 && screenWidth <= 1440) {
      return 3.0;
    } else if (screenWidth > 1440 && screenWidth <= 2160) {
      return 4.0;
    } else if (screenWidth > 2160 && screenWidth <= 2880) {
      return 5.0;
    } else if (screenWidth > 2880 && screenWidth <= 4320) {
      return 6.0;
    } else if (screenWidth > 4320 && screenWidth <= 5760) {
      return 7.0;
    } else if (screenWidth > 5760 && screenWidth <= 8640) {
      return 8.0;
    } else if (screenWidth > 8640 && screenWidth <= 11520) {
      return 9.0;
    } else if (screenWidth > 11520 && screenWidth <= 17280) {
      return 10.0;
    } else if (screenWidth > 17280 && screenWidth <= 23040) {
      return 11.0;
    } else if (screenWidth > 23040 && screenWidth <= 34560) {
      return 12.0;
    } else if (screenWidth > 34560 && screenWidth <= 46080) {
      return 13.0;
    }
    return 2.0; // Default scaling factor
  }
}
