import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyRestrictedView extends StatelessWidget {
  const FlyRestrictedView({
    super.key,
    this.condition = false,
    required this.child,
    required this.role,
  });

  final bool condition;
  final Widget child;
  final String role;

  @override
  Widget build(BuildContext context) {
    return condition
        ? child
        : Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Text.rich(
              TextSpan(
                text: 'Sharable.$role'.tr,
                children: [
                  TextSpan(
                    text: ', ',
                    style: Get.textTheme.labelLarge,
                  ),
                  TextSpan(
                    text: 'Sharable.$role role hint'.tr,
                    style: Get.textTheme.labelSmall,
                  )
                ],
              ),
              style: Get.textTheme.labelLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          );
  }
}
