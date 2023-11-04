import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class FlyDrawerController extends GetxController {
  static FlyDrawerController get to => Get.find();

  final zoomDrawerController = ZoomDrawerController();
  final RxBool status = RxBool(false);

  @override
  void onInit() {

    zoomDrawerController.stateNotifier?.addListener(() { 
          status.value = zoomDrawerController.isOpen as bool;
    });

    super.onInit();
  }

  void toggleDrawer() async {
    await Future.delayed(const Duration(milliseconds: 390));
    zoomDrawerController.toggle?.call();
  }
}
