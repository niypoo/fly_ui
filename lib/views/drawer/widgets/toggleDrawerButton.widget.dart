import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/drawer/drawer.controller.dart';
import 'package:fly_ui/views/widgets/buttons/circalButton.widget.dart';
import 'package:unicons/unicons.dart';

class FlyDrawerToggleButton extends StatelessWidget {
  const FlyDrawerToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlyCircleButton(
      icon: UniconsLine.bars,
      onPressed: FlyDrawerController.to.toggleDrawer,
    );
  }
}
