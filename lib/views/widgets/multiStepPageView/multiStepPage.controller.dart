import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MultiStepPageController extends GetxController {
  static MultiStepPageController get to => Get.find();

  // properties
  int step = 1;
  final PageController pageController = PageController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // NEXT PAGE
  next() {
    pageController.nextPage(
      duration: AppConfigService.to.duration,
      curve: AppConfigService.to.curve,
    );

    // increment
    step = step + 1;

    // update widget
    update();
  }

  // NEXT PAGE
  back() {
    pageController.previousPage(
      duration: AppConfigService.to.duration,
      curve: AppConfigService.to.curve,
    );

    // increment
    step = step - 1;

    // update widget
    update();
  }

  cancel() => Get.back();
}
