import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyIconOutlineButton extends StatelessWidget {
  const FlyIconOutlineButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.margin,
    this.padding,
  });

  final IconData icon;
  final Function? onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(color: Get.theme.primaryColor),
      ),
      child: IconButton(
        padding: padding ?? EdgeInsets.only(left: 5.sp),
        constraints: const BoxConstraints(),
        icon: Icon(icon, 
        // size: 14.sp
        ),
        onPressed: onPressed as void Function()?,
        color: Get.theme.primaryColor,
      ),
    );
  }
}
