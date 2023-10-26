import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

extension Responsive on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * (isLandscape ? (Get.width / 2) : Get.height) / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this *  (isLandscape ? (Get.width / 2) : Get.width) / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (Get.width / 3) / 100;

  bool get isLandscape => Get.mediaQuery.orientation == Orientation.landscape;
}
