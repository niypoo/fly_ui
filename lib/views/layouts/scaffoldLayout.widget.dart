import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldPadding.widget.dart';

class FlyScaffold extends StatelessWidget {
  const FlyScaffold({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  final Widget? appBar;
  final Color? backgroundColor;
  final Widget child;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar as PreferredSizeWidget?,
      backgroundColor: backgroundColor,
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: FlyScaffoldPadding(child: child),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
    );
  }
}
