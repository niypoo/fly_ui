import 'dart:ui';

extension Responsive on num {
  /// handle device sizes
  FlutterView get view => PlatformDispatcher.instance.views.first;

  /// define a get device width
  double get physicalWidth => view.physicalSize.width;

  /// define a get device height
  double get physicalHeight => view.physicalSize.height;

  /// define a get device ratio
  double get devicePixelRatio => view.devicePixelRatio;

  /// define a get is landscape mode
  bool get isLandscape => view.physicalSize.aspectRatio > 1;

  /// define a get screen width
  double get screeWidth => physicalWidth / devicePixelRatio;

  /// define a get screen height
  double get screenHeight => physicalHeight / devicePixelRatio;

  /// Calculates the height depending on the device's screen size
  double get h => this * screenHeight / 100;

  /// Calculates the width depending on the device's screen size
  double get w => this * screeWidth / 100;

  ///This is useful in cas you split screen in landscape mode
  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get dp => this * getScalingFactor();

  ///Calculates the sp (Scalable Pixel Half Screen) depending on the device's screen size
  double get sp => (this * getScalingFactor()) * (isLandscape ? 0.5 : 1.0);

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double getScalingFactor() {
    if (physicalWidth <= 360) {
      return 1.0;
    } else if (physicalWidth <= 720) {
      // Linear interpolation between (360, 1.0) and (720, 1.2)
      return 1.2 + (physicalWidth - 360) * (1.2 - 1.0) / (720 - 360);
    } else if (physicalWidth <= 1440) {
      // Linear interpolation between (720, 1.2) and (1440, 1.3)
      return 1.4 + (physicalWidth - 720) * (1.3 - 1.2) / (1440 - 720);
    } else if (physicalWidth <= 2160) {
      // Linear interpolation between (1440, 1.3) and (2160, 1.8)
      return 1.5 + (physicalWidth - 1440) * (1.8 - 1.3) / (2160 - 1440);
    } else if (physicalWidth <= 4320) {
      // Linear interpolation between (2160, 1.8) and (2.5)
      return 2.0 + (physicalWidth - 2160) * (2.5 - 1.8) / (4320 - 2160);
    } else if (physicalWidth <= 8640) {
      // Linear interpolation between (4320, 2.5) and (3.8)
      return 2.7 + (physicalWidth - 4320) * (3.8 - 2.5) / (8640 - 4320);
    } else if (physicalWidth <= 11520) {
      // Linear interpolation between (8640, 3.8) and (2.6)
      return 4.0 + (physicalWidth - 8640) * (2.6 - 3.8) / (11520 - 8640);
    } else if (physicalWidth <= 17280) {
      // Linear interpolation between (11520, 2.6) and (2.8)
      return 2.8 + (physicalWidth - 11520) * (2.8 - 2.6) / (17280 - 11520);
    } else if (physicalWidth <= 23040) {
      // Linear interpolation between (17280, 2.8) and (3.0)
      return 3.0 + (physicalWidth - 17280) * (3.0 - 2.8) / (23040 - 17280);
    } else if (physicalWidth <= 34560) {
      // Linear interpolation between (23040, 3.0) and (3.5)
      return 3.2 + (physicalWidth - 23040) * (3.5 - 3.0) / (34560 - 23040);
    } else if (physicalWidth <= 46080) {
      // Linear interpolation between (34560, 3.5) and (4.0)
      return 3.7 + (physicalWidth - 34560) * (4.0 - 3.5) / (46080 - 34560);
    } else {
      // Linear interpolation between (46080, 4.0) and (4.0)
      return 4.2 + (physicalWidth - 46080) * (4.0 - 4.0) / (57600 - 46080);
    }
  }
}



    // if (physicalWidth <= 360) {
    //   return 1.0;
    // } else if (physicalWidth > 360 && physicalWidth <= 411) {
    //   return 1.1;
    // } else if (physicalWidth > 411 && physicalWidth <= 480) {
    //   return 1.1;
    // } else if (physicalWidth > 480 && physicalWidth <= 540) {
    //   return 1.1;
    // } else if (physicalWidth > 540 && physicalWidth <= 600) {
    //   return 1.2;
    // } else if (physicalWidth > 600 && physicalWidth <= 720) {
    //   return 1.2;
    // } else if (physicalWidth > 720 && physicalWidth <= 1080) {
    //   return 1.2;
    // } else if (physicalWidth > 1080 && physicalWidth <= 1440) {
    //   return 1.3;
    // } else if (physicalWidth > 1440 && physicalWidth <= 2160) {
    //   return 1.8;
    // } else if (physicalWidth > 2160 && physicalWidth <= 2880) {
    //   return 2.0;
    // } else if (physicalWidth > 2880 && physicalWidth <= 4320) {
    //   return 2.5;
    // } else if (physicalWidth > 4320 && physicalWidth <= 5760) {
    //   return 3.0;
    // } else if (physicalWidth > 5760 && physicalWidth <= 8640) {
    //   return 3.8;
    // } else if (physicalWidth > 8640 && physicalWidth <= 11520) {
    //   return 2.6;
    // } else if (physicalWidth > 11520 && physicalWidth <= 17280) {
    //   return 2.8;
    // } else if (physicalWidth > 17280 && physicalWidth <= 23040) {
    //   return 3.0;
    // } else if (physicalWidth > 23040 && physicalWidth <= 34560) {
    //   return 3.5;
    // } else if (physicalWidth > 34560 && physicalWidth <= 46080) {
    //   return 4.0;
    // }
