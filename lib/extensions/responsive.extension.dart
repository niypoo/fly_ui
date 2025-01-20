// import 'dart:ui';

// extension Responsive on num {
  
//   // handle device sizes
//   FlutterView get view => PlatformDispatcher.instance.views.first;
//   double get physicalWidth => view.physicalSize.width;
//   double get physicalHeight => view.physicalSize.height;
//   double get devicePixelRatio => view.devicePixelRatio;
  
//   bool get isLandscape => view.physicalSize.aspectRatio > 1;
//   double get screeWidth => physicalWidth / devicePixelRatio;
//   double get screenHeight => physicalHeight / devicePixelRatio;


//   /// Calculates the height depending on the device's screen size
//   double get h => this * screenHeight / 100;

//   /// Calculates the width depending on the device's screen size
//   double get w => this *  screeWidth / 100;

//   ///Calculates the sp (Scalable Pixel Half Screen) depending on the device's screen size
//   ///This is useful in cas you split screen in landscape mode 
//   double get sph => this *  (isLandscape ? (screeWidth * 0.5) : screeWidth) / 100;

//   /// Calculates the sp (Scalable Pixel) depending on the device's screen size
//   double get sp => this * ((isLandscape ? screenHeight : screeWidth) / devicePixelRatio) / 100;

  
// }
