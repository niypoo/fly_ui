import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyMenuScreen extends StatelessWidget {
  final Widget? header;
  final List<Widget> items;

  const FlyMenuScreen({
    super.key,
    this.header,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(vertical: context.isLandscape ? 5.h : 3.h),
        child: Row(
          children: [
            // as padding
            SizedBox(width: context.isLandscape ? 4.h : 2.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // header
                  if (header != null) header!,

                  // padding space
                  SizedBox(height: 10.sp),

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
