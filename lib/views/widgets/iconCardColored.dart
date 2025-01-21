import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:patata_responsive/patata_responsive.dart';

class FlyIconCardColored extends StatelessWidget {
  const FlyIconCardColored({
    Key? key,
    this.color,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  final Color? color;
  final Color? iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      padding: EdgeInsets.all(4.sp),
      color: color,
      child: Icon(icon, color: iconColor),
    );
  }
}
