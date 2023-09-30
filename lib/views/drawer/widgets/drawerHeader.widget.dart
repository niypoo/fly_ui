import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:fly_ui/views/drawer/widgets/drawerUserDetails.widget.dart';
import 'package:fly_ui/views/widgets/buttons/circalButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyDrawerHeader extends GetView<FlyDrawerController> {
  const FlyDrawerHeader({
    Key? key,
    this.onTap,
    this.primaryButton,
    this.photoUrl,
    this.displayName,
    this.id,
  }) : super(key: key);

  final String? photoUrl;
  final String? displayName;
  final String? id;
  final Function? onTap;
  final Widget? primaryButton;

  @override
  Widget build(BuildContext context) {
    // DIA INFORMATION With CLOSE BUTTON
    return Stack(
      children: [
        // DIA INFORMATION
        FlyDrawerUserDetails(
          displayName: displayName,
          photoUrl: photoUrl,
          id: id,
          onTap: onTap,
        ),

        // CLOSE BUTTON
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlyCircleButton(
              icon: UniconsLine.times,
              padding: const EdgeInsets.all(10),
              onPressed: controller.toggleDrawer,
              color: Get.theme.scaffoldBackgroundColor,
            ),
          ],
        ),

        if (primaryButton != null)
          Positioned(
            top: 95,
            child: SizedBox(height: 40, child: primaryButton),
          )
      ],
    );
  }
}
