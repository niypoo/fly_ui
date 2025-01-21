import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class FlyDrawerController extends GetxController {
  static FlyDrawerController get to => Get.find();

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  // true = open | false = close
  final RxBool status = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    zoomDrawerController.stateNotifier!.addListener(
      () async {        
        status.value =
            zoomDrawerController.stateNotifier!.value == DrawerState.open;
      },
    );

    super.onReady();
  }

  void toggleDrawer() async {
    zoomDrawerController.toggle?.call();
  }
}
