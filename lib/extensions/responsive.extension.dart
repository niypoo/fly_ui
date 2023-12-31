import 'package:get/get.dart';

extension Responsive on num {
  /// Calculates the height depending on the device's screen size
  double get h => this * Get.height / 100;

  /// Calculates the width depending on the device's screen size
  double get w => this *  Get.width / 100;

  // split width in landscape (2 half)
  double get sw => this *  (isLandscape ? (Get.width * 0.5) : Get.width) / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * ((isLandscape ? Get.height : Get.width) / fontSizeDividedRation) / 100;

  // if landscape
  bool get isLandscape => Get.context!.isLandscape;

  // define what a ratio that I will divided font
  int get fontSizeDividedRation => Get.context!.isPhone ? 3 : 5;
  
}
