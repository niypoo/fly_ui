import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fly_ui/views/widgets/images/imageContainer.widget.dart';
import 'package:get/get.dart';

class FlyImage extends StatelessWidget {
  const FlyImage({
    Key? key,
    this.height,
    this.width,
    this.url,
    this.margin,
    this.placeholder = 'assets/images/placeholder.png',
    this.padding,
    this.border,
    this.child,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? url;
  final String placeholder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // first check url if not valid show placeholder
    if (url == null || url!.trim().isEmpty) {
      return FlyImageContainer(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        image: AssetImage(placeholder),
        border: border,
        child: child,
      );
    }

    // 2- check url if svg show image as svg
    else if (!GetUtils.isURL(url!) && url!.toLowerCase().contains('.svg')) {
      return Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        child: SvgPicture.asset(url!),
      );
    }
    // 3- check url if from inside device show asset image not cach
    else if (!GetUtils.isURL(url!) && !url!.contains('https://')) {
      return FlyImageContainer(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        border: border,
        image: AssetImage(url!),
        child: child,
      );
    }
    // if url is url from outside
    else {
      return CachedNetworkImage(
        imageUrl: url!,
        imageBuilder: (context, imageProvider) {
          return FlyImageContainer(
            height: height,
            width: width,
            margin: margin,
            padding: padding,
            border: border,
            image: imageProvider,
            child: child,
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            FlyImageContainer(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          border: border,
          image: AssetImage(placeholder),
          child: const SizedBox.shrink(),
        ),
        errorWidget: (context, url, error) => FlyImageContainer(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          border: border,
          image: AssetImage(placeholder),
          child: child,
        ),
      );
    }
  }
}
