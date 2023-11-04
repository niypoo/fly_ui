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

  @override
  void onReady() {
    zoomDrawerController.stateNotifier!.addListener(() {
      print('[[[[[[[[zoomDrawerController]]]]]]]]');
      print(zoomDrawerController.stateNotifier!.value == DrawerState.open);
      print(zoomDrawerController.isOpen!());
      print(zoomDrawerController.close!());
      print('[[[[[[[[zoomDrawerController]]]]]]]]');
    });

    super.onReady();
  }

  void toggleDrawer() async {
    await Future.delayed(const Duration(milliseconds: 390));
    zoomDrawerController.toggle?.call();
  }
}
