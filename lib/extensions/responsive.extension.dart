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
  double get sp => this * ((isLandscape ? Get.height : Get.width) / fontSizeDividedRation) / 100;

  bool get isLandscape => Get.context!.isLandscape;

  // define what a ratio that I will divided font
  int get fontSizeDividedRation => Get.context!.isPhone ?  3 : 5;
}
