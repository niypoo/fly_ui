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

  ///Calculates the sp (Scalable Pixel Half Screen) depending on the device's screen size
  ///This is useful in cas you split screen in landscape mode
  double get sph => isLandscape ? (this).sp * 0.5 : (this).sp;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * getScalingFactor();

  double getScalingFactor() {
    if (physicalWidth <= 360) {
      return 1.0;
    } else if (physicalWidth > 360 && physicalWidth <= 411) {
      return 1.1;
    } else if (physicalWidth > 411 && physicalWidth <= 480) {
      return 1.2;
    } else if (physicalWidth > 480 && physicalWidth <= 540) {
      return 1.3;
    } else if (physicalWidth > 540 && physicalWidth <= 600) {
      return 1.4;
    } else if (physicalWidth > 600 && physicalWidth <= 720) {
      return 1.5;
    } else if (physicalWidth > 720 && physicalWidth <= 1080) {
      return 1.6;
    } else if (physicalWidth > 1080 && physicalWidth <= 1440) {
      return 1.7;
    } else if (physicalWidth > 1440 && physicalWidth <= 2160) {
      return 2.0;
    } else if (physicalWidth > 2160 && physicalWidth <= 2880) {
      return 1.9;
    } else if (physicalWidth > 2880 && physicalWidth <= 4320) {
      return 2.0;
    } else if (physicalWidth > 4320 && physicalWidth <= 5760) {
      return 2.2;
    } else if (physicalWidth > 5760 && physicalWidth <= 8640) {
      return 2.4;
    } else if (physicalWidth > 8640 && physicalWidth <= 11520) {
      return 2.6;
    } else if (physicalWidth > 11520 && physicalWidth <= 17280) {
      return 2.8;
    } else if (physicalWidth > 17280 && physicalWidth <= 23040) {
      return 3.0;
    } else if (physicalWidth > 23040 && physicalWidth <= 34560) {
      return 3.5;
    } else if (physicalWidth > 34560 && physicalWidth <= 46080) {
      return 4.0;
    }

    return 2.0; // Default scaling factor
  }
}
