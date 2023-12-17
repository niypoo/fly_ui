import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyTableRow extends StatelessWidget {
  const FlyTableRow({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.onTap,
    this.bottomHint,
    this.disabledDivider = false,
  }) : super(key: key);

  final Function? onTap;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? bottomHint;
  final bool disabledDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (disabledDivider)
          Divider(
            color: Get.iconColor!.withOpacity(0.2),
            height: AppConfigService.to.space!.l,
            indent: 10,
            endIndent: 10,
          ),
        FlyInkWell(onTap: onTap, child: Row(children: children)),
        if (bottomHint != null) bottomHint!,
      ],
    );
  }
}
