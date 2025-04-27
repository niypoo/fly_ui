import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class FlyAnimatedRandomFade extends StatefulWidget {
  const FlyAnimatedRandomFade({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _FlyAnimatedRandomFadeState createState() => _FlyAnimatedRandomFadeState();
}

class _FlyAnimatedRandomFadeState extends State<FlyAnimatedRandomFade> {
  Duration duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    final int randomDuration = Random().nextInt(2000) + 500;

    duration = Duration(
        milliseconds: randomDuration.isNaN
            ? 500
            : randomDuration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      preferences: AnimationPreferences(duration: duration),
      child: widget.child,
    );
  }
}
