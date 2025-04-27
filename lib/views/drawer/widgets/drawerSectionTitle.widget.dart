import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/bigPageHeadTitle.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

class FlyDrawerSectionTitle extends StatelessWidget {
  final String title;

  const FlyDrawerSectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: 20.sp,
        bottom: 5.sp,
      ),
      child: FlyListHeadTitle(
        text: title,
      ),
    );
  }
}
