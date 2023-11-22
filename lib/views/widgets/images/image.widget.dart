import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/images/imageContainer.widget.dart';
import 'package:get/get.dart';

class FlyImage extends StatelessWidget {
  const FlyImage({
    Key? key,
    this.height,
    this.width,
    this.url,
    this.margin,
    this.placeholder = 'assets/icon/icon.jpg',
    this.padding,
    this.border,
    this.actions = const [],
    this.radius,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? radius;
  final String? url;
  final String placeholder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;

  final List<Widget> actions;

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
        radius: radius,
        child: FlyImageActionsButtons(children: actions),
      );
    }

    // 2- check url if svg show image as svg
    else if (!GetUtils.isURL(url!) && url!.toLowerCase().contains('.svg')) {
      return Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          // color: Get.theme.primaryColor,
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 15.sp),
        ),
        child: SvgPicture.asset(url!),
      );
    }
    // 3- check url if from inside device show asset image not cache
    else if (!GetUtils.isURL(url!) && !url!.contains('https://')) {
      return FlyImageContainer(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        border: border,
        image: AssetImage(url!),
        radius: radius,
        child: FlyImageActionsButtons(children: actions),
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
            radius: radius,
            child: FlyImageActionsButtons(children: actions),
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
          radius: radius,
          child: const SizedBox.shrink(),
        ),
        errorWidget: (context, url, error) => FlyImageContainer(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          border: border,
          image: AssetImage(placeholder),
          radius: radius,
          child: FlyImageActionsButtons(children: actions),
        ),
      );
    }
  }
}

class FlyImageActionsButtons extends StatelessWidget {
  const FlyImageActionsButtons({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.end,
        runSpacing: 8,
        spacing: 8,
        children: children,
      ),
    );
  }
}
