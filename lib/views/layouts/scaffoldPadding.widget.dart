import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyScaffoldPadding extends StatelessWidget {
  const FlyScaffoldPadding({
    super.key,
    required this.child,
    this.disabled = false,
  });

  final Widget? child;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: disabled
            ? 0
            : context.isPhone
                ? 3.sph
                : 5.sph,
        right: disabled
            ? 0
            : context.isPhone
                ? 3.sph
                : 5.sph,
      ),
      child: child,
    );
  }
}

class FlyScaffoldPreferredPadding extends StatelessWidget
    implements PreferredSizeWidget {
  const FlyScaffoldPreferredPadding({
    super.key,
    required this.child,
    this.disabled = false,
  });

  final Widget? child;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: disabled
            ? 0
            : context.isPhone
                ? 3.sph
                : 5.sph,
        right: disabled
            ? 0
            : context.isPhone
                ? 3.sph
                : 5.sph,
      ),
      child: child,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
