import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:get/get.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class FlyImagePanorama extends StatelessWidget {
  const FlyImagePanorama({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return FlyImage(
      height: (context.isLandscape ? context.height : context.width) * 0.4,
      url: photoUrl,
      margin: EdgeInsets.only(bottom: 8.sp),
    );
  }
}
