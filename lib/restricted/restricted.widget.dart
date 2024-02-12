import 'package:flutter/widgets.dart';

class FlyRestricted extends StatelessWidget {
  const FlyRestricted({
    super.key,
    this.condition = false,
    required this.child,
  });

  final bool condition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return condition ? child : const SizedBox.shrink();
  }
}
