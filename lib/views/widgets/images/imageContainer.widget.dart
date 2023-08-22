import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';

class FlyImageContainer extends StatelessWidget {
  const FlyImageContainer({
    Key? key,
    required this.height,
    required this.width,
    this.margin,
    this.padding,
    this.child,
    this.border,
    this.radius,
    required this.image,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final dynamic image;
  final Widget? child;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        // color: Get.theme.primaryColor,
        border: border,
        borderRadius: BorderRadius.circular(
          radius ?? AppConfigService.to.radius,
        ),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
