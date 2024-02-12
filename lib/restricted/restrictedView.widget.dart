import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/widgets/pageMessage.widget.dart';
import 'package:get/get.dart';

class FlyRestrictedView extends StatelessWidget {
  const FlyRestrictedView({
    super.key,
    this.condition = false,
    required this.restrictedChild,
  });

  final bool condition;
  final Widget restrictedChild;

  @override
  Widget build(BuildContext context) {
    return condition
        ? restrictedChild
        : FlyContainerMessage(
            body:
                "UI.seems that your account does not have an eligible role.".tr,
            title: 'UI.Not Athorized.'.tr,
          );
  }
}
