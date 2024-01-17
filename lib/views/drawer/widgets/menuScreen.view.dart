import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyMenuScreen extends StatelessWidget {
  final Widget? header;
  final List<Widget> items;

  const FlyMenuScreen({
    Key? key,
    this.header,
    this.items = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(vertical: context.isLandscape ? 5.h : 3.h),
        child: Row(
          children: [
            // as padding
            SizedBox(width: context.isLandscape ? 5.h : 3.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // header
                  if (header != null) header!,

                  // padding space
                  SizedBox(height: 30.sp),

                  // menu items
                  ...items,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
