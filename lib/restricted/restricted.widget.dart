import 'package:flutter/widgets.dart';

class FlyRestricted extends StatelessWidget {
  const FlyRestricted({
    super.key,
    this.condition = false,
    required this.restrictedChild,
  });

  final bool condition;
  final Widget restrictedChild;

  @override
  Widget build(BuildContext context) {
    return condition ? restrictedChild : const SizedBox.shrink();
  }
}
