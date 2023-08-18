import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyCheckboxTile extends StatelessWidget {
  const FlyCheckboxTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.value,
    this.hint,
    this.enableDivider = false,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function onTap;
  final String? hint;
  final bool enableDivider;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onTap: () => onTap(!value),
      child: FlyContainer(
        color: value ? Get.theme.highlightColor : Get.theme.cardColor,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Checkbox(
                    activeColor:
                        value ? Get.theme.cardColor : Get.theme.highlightColor,
                    checkColor: Get.theme.iconTheme.color,
                    value: value,
                    onChanged: onTap as void Function(bool?)?,
                  ),
                ),
                SizedBox(width: AppConfigService.to.space!.s),
                Expanded(
                  child: AutoSizeText(
                    title,
                    style: Get.textTheme.labelLarge,
                  ),
                )
              ],
            ),

            if (enableDivider)
              Divider(
                color: Get.theme.primaryColor.withOpacity(0.2),
                height: AppConfigService.to.space!.l,
              ),

            // hint if STRING OR Widget
            if (hint != null)
              Padding(
                padding: enableDivider
                    ? const EdgeInsets.all(0)
                    : EdgeInsets.only(
                        top: AppConfigService.to.space!.l,
                      ),
                child: AutoSizeText(
                  hint!,
                  style: Get.textTheme.bodyMedium!
                      .copyWith(color: value ? Get.theme.primaryColor : null),
                ),
              )
          ],
        ),
      ),
    );
  }
}
