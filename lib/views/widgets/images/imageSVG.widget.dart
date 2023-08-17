import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlyImageSVG extends StatelessWidget {
  const FlyImageSVG({
    Key? key,
    this.path,
    this.height = 50,
    this.width = 50,
  }) : super(key: key);

  final String? path;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path!,
      height: height,
      width: width,
    );
  }
}
