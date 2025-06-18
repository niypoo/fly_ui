import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/layouts/nestedScrollView.widget.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/widgets/appBar.widget.dart';
import 'package:fly_ui/views/widgets/sliverContainer.widget.dart';

class FlyNestedScrollPage extends StatelessWidget {
  const FlyNestedScrollPage({
    super.key,
    required this.child,
    required this.title,
    this.appBarActionButtons = const [],
    this.floatingActionButton = const [],
  });

  final String title;
  final Widget child;
  final List<Widget> appBarActionButtons;
  final List<Widget> floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Wrap(spacing: 5.sp, children: floatingActionButton),
      child: FlyNestedScrollView(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          child: child,
        ),
        headerSliverBuilder: [
          SliverPersistentHeader(
            delegate: FlySliverContainer(
              initMaxExtent: 40.sp,
              initMinExtent: 40.sp,
              child: (bool isCollapse, double shrinkOffset) => FlyAppBar(
                title: title,
                actions: appBarActionButtons,
              ),
            ),
            pinned: false,
            floating: true,
          ),
        ],
      ),
    );
  }
}
