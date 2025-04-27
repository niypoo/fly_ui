import 'package:get/get.dart';

extension Responsive on num {
  
  bool get isLandscape =>Get.context!.isLandscape ;
  bool get isTablet =>Get.context!.isTablet; 
  double get screeWidth => Get.width;
  double get screenHeight => Get.height;
  int get devicePixelRatio => isTablet ? 12 : 3;


  /// Calculates the height depending on the device's screen size
  double get h => this * screenHeight / 100;

  /// Calculates the width depending on the device's screen size
  double get w => this *  screeWidth / 100;

  ///Calculates the sp (Scalable Pixel Half Screen) depending on the device's screen size
  ///This is useful in cas you split screen in landscape mode 
  double get sph => this *  (isLandscape ? (screeWidth * 0.5) : screeWidth) / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (screenHeight / devicePixelRatio) / 100;

  
}
