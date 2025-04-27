// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FlyDropLoading extends StatefulWidget {
  const FlyDropLoading({
    super.key,
    required this.size,
    required this.gradient,
    // this.duration,
    // this.stopOnDegree,
    // this.startOnDegree = 2,
    // this.noAnimationDegree,
    // this.curves,
    this.child,
  });

  final double size;
  // final Duration? duration;
  // final Curve? curves;
  final LinearGradient gradient;
  final Widget? child;
  // final int? startOnDegree;
  // final int? stopOnDegree;
  // final int? noAnimationDegree;

  @override
  _FlyDropLoadingState createState() => _FlyDropLoadingState();
}

class _FlyDropLoadingState extends State<FlyDropLoading>
    with TickerProviderStateMixin {
  // Properties
  final Curve _curves = Curves.easeInOut;
  final Duration _duration = const Duration(milliseconds: 500);
  int _index = 7;
  late Animation<double> _animation;
  late AnimationController _controller;

  final List<List<double>> radiusList = [
    [0.05, 0.05, 0.05, 0.05],
    [0.5, 0.05, 0.05, 0.05],
    [0.5, 0.5, 0.05, 0.05],
    [0.5, 0.5, 0.5, 0.05],
    [0.5, 0.5, 0.5, 0.5],
    [0.05, 0.5, 0.5, 0.5],
    [0.05, 0.05, 0.5, 0.5],
    [0.05, 0.05, 0.05, 0.5],
    [0.05, 0.05, 0.05, 0.05],
  ];

  final List<double> rotationList = [
    0 / 360,
    45 / 360,
    90 / 360,
    135 / 360,
    180 / 360,
    225 / 360,
    270 / 360,
    315 / 360,
    360 / 360,
  ];

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // _index = widget.noAnimationDegree;

    _controller = AnimationController(vsync: this, duration: _duration);

    // define _animation with degree and _animation
    _animation = Tween<double>(
            begin: rotationList[_index], end: rotationList[_index + 1])
        .animate(CurvedAnimation(parent: _controller, curve: _curves));

    // start _animation with 1st properties
    toNextIndex();

    // listen to _animation _controller
    // if (widget.noAnimationDegree == null) {
    _controller.addListener(
      () {
        if (_controller.isCompleted) toNextIndex();
      },
    );
    // }
  }

  toNextIndex() {
    // // if degree exist stop on it
    // if (widget.stopOnDegree == _index) return;

    // define _animation with degree and _animation
    _animation = Tween<double>(
            begin: rotationList[_index], end: rotationList[_index + 1])
        .animate(CurvedAnimation(parent: _controller, curve: _curves));

    // rest animation and forward to next
    _controller.reset();
    _controller.forward();

    // change _index
    setState(() {
      _index = _index >= 7 ? 0 : _index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: AnimatedContainer(
        height: widget.size,
        width: widget.size,
        duration: _duration,
        curve: _curves,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            // Top
            topLeft: Radius.circular(widget.size * radiusList[_index][0]),
            // Right
            topRight: Radius.circular(widget.size * radiusList[_index][1]),
            // Down
            bottomRight: Radius.circular(widget.size * radiusList[_index][2]),
            // Left
            bottomLeft: Radius.circular(widget.size * radiusList[_index][3]),
          ),
          gradient: widget.gradient,
        ),
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
  }
}
