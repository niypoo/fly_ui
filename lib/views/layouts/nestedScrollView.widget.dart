import 'package:flutter/widgets.dart';

class FlyNestedScrollView extends StatelessWidget {
  const FlyNestedScrollView({
    Key? key,
    required this.body,
    this.children,
    this.controller,
  }) : super(key: key);

  final List<SliverPersistentHeader>? children;
  final Widget body;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => children!,
      body: body,
    );
  }
}
