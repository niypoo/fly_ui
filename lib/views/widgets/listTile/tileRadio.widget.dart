import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';

class FlyRadioListTile extends StatelessWidget {
  const FlyRadioListTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.value,
    required this.valueGroup,
    this.hint,
    this.bgColor,
    this.enableDivider = false,
  }) : super(key: key);

  final String title;
  final dynamic value;
  final dynamic valueGroup;
  final Function onTap;
  final String? hint;
  final bool enableDivider;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == valueGroup;

    return FlyInkWell(
      onTap: () => onTap(value),
      child: FlyContainer(
        color: isSelected ? Get.theme.highlightColor : Get.theme.cardColor,
        child: Row(
          children: [
            SizedBox(
              height: 20.sp,
              width: 20.sp,
              child: Radio(
                activeColor: Get.theme.iconTheme.color,
                value: value,
                groupValue: valueGroup,
                onChanged: (dynamic value) => onTap(value),
              ),
            ),

            // Space
            SizedBox(width: 5.sp),

            // text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  if (hint != null)
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp),
                      child: AutoSizeText(
                        hint!,
                        style: Get.textTheme.bodyMedium!.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
