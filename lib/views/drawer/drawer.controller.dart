import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class FlyDrawerController extends GetxController {
  static FlyDrawerController get to => Get.find();

  final zoomDrawerController = ZoomDrawerController();
  final RxBool status = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  void toggleDrawer() async {
    status.value = !status.value;
    await Future.delayed(const Duration(milliseconds: 300));
    zoomDrawerController.toggle?.call();
  }
}
