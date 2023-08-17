import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:get/get.dart';

class FlyDrawerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlyDrawerController>(() => FlyDrawerController());
  }
}
