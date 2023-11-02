import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';

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
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // header
            if (header != null) header!,
    
            // menu items
            ...items,
          ],
        ),
      ),
    );
  }
}
