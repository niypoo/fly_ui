import 'package:flutter/widgets.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyDrawerToggleButton extends GetView<FlyDrawerController> {
  const FlyDrawerToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.status.isFalse) {
          return SlideInDown(
            key: ValueKey('FlyDrawerToggleButton-${controller.status.value}'),
            child: const DrawerButton(),
          );
        } else {
          return SlideOutUp(
            key: ValueKey('FlyDrawerToggleButton-${controller.status.value}'),
            child: const DrawerButton(),
          );
        }
      },
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlyIconButton(
      icon: UniconsLine.bars,
      onPressed: FlyDrawerController.to.toggleDrawer,
    );
  }
}
