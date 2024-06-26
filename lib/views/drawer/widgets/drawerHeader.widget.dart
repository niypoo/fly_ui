import 'package:flutter/widgets.dart';
// import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:fly_ui/views/drawer/widgets/drawerUserDetails.widget.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyDrawerHeader extends GetView<FlyDrawerController> {
  const FlyDrawerHeader({
    Key? key,
    this.onTap,
    this.actionButton,
    this.photoUrl,
    this.displayName,
    this.slug,
    this.id,
  }) : super(key: key);

  final String? photoUrl;
  final String? displayName;
  final String? slug;
  final String? id;
  final Function? onTap;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    // DIA INFORMATION With CLOSE BUTTON
    return Column(
      children: [
        // CLOSE BUTTON
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Obx(
            //   () => SlideInDown(
            //     preferences: AnimationPreferences(
            //       autoPlay: controller.status.isTrue
            //           ? AnimationPlayStates.Forward
            //           : AnimationPlayStates.Reverse,
            //     ),
            //     key: ValueKey(
            //         'FlyDrawerHeader-drawer-button-${controller.status.value}'),
            //     child: const DrawerButton(),
            //   ),
            // ),
            DrawerButton(),
          ],
        ),

        // DIA INFORMATION
        FlyDrawerUserDetails(
          displayName: displayName,
          photoUrl: photoUrl,
          id: id,
          slug: slug,
          onTap: onTap,
          actionButton: actionButton,
        ),
      ],
    );
  }
}

class DrawerButton extends GetView<FlyDrawerController> {
  const DrawerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlyIconButton(
      icon: UniconsLine.times,
      onPressed: controller.toggleDrawer,
      bgColor: Get.theme.scaffoldBackgroundColor,
    );
  }
}
