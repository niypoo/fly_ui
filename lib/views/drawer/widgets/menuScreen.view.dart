import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // header
        if (header != null) header!,

        // menu items
        ...items,
      ],
    );
  }
}
