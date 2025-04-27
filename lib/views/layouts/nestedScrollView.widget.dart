import 'package:flutter/widgets.dart';

class FlyNestedScrollView extends StatelessWidget {
  const FlyNestedScrollView({
    Key? key,
    required this.body,
    required this.headerSliverBuilder,
    this.controller,
  }) : super(key: key);

  final List<Widget> headerSliverBuilder;
  final Widget body;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          headerSliverBuilder,
      body: body,
    );
  }
}
