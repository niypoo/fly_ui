import 'package:flutter/widgets.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:patata_responsive/patata_responsive.dart';

class FlyFloatingButton extends StatelessWidget {
  const FlyFloatingButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.bgColor,
    this.iconColor,
  });

  final Function onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: FlyIconButton(
        padding: EdgeInsets.all(4.sp),
        icon: icon,
        bgColor: bgColor,
        colorIcon: iconColor,
        onPressed: onTap,
      ),
    );
  }
}
