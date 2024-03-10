import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/models/SelectorOption.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/containers/continerColored.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlySelectorArea extends StatelessWidget {
  const FlySelectorArea({
    Key? key,
    required this.options,
    required this.onTap,
    this.label = '',
    this.selectedOption,
    this.color,
    this.textColor,
    this.title,
    this.crossAxisCount,
  }) : super(key: key);

  final int? crossAxisCount;
  final String label;
  final String? title;
  final Color? color;
  final Color? textColor;
  final List<SelectorOption> options;
  final dynamic selectedOption;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: color ?? Get.theme.cardColor,
      margin: EdgeInsets.only(bottom: 10.sp),
      padding: EdgeInsets.symmetric(vertical:10.sp , horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          if (title != null)
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 10.sp, start: 10.sp),
              child: Row(
                children: [
                  AutoSizeText(
                    title!,
                    style: Get.textTheme.labelLarge!.copyWith(
                      color: textColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          SizedBox(
            height: 90.sp,
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 5.sp,
                runSpacing: 5.sp,
                alignment: WrapAlignment.center,
                children: options.map((option) {
                  // is selected
                  final bool isSelected =
                      describeEnum(selectedOption) == option.name;
              
                  // return widget
                  return FlySelectorOption(
                    color: color,
                    label: label,
                    selectedColor: Get.theme.primaryColor,
                    name: option.name,
                    subName: option.subName,
                    image: option.image,
                    moreInformation: option.moreInformation,
                    isSelected: isSelected,
                    onTap: () => onTap(option.name),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlySelectorOption extends StatelessWidget {
  const FlySelectorOption({
    Key? key,
    required this.color,
    required this.selectedColor,
    required this.name,
    this.image,
    this.isSelected = false,
    this.onTap,
    this.moreInformation,
    this.label,
    this.subName,
  }) : super(key: key);

  final Color? color;
  final Color selectedColor;
  final String name;
  final Widget? image;
  final Function? onTap;
  final Function? moreInformation;
  final bool isSelected;
  final String? label;
  final String? subName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(15.sp),
          onTap: onTap as void Function()?,
          child: FlyContainerColored(
            margin:const  EdgeInsets.all(0),
            width: 70.sp,
            height: 80.sp,
            color: isSelected
                ? selectedColor.withOpacity(0.1)
                : Get.theme.scaffoldBackgroundColor.withOpacity(0.6),
            colorBorder:
                isSelected ? selectedColor : Get.theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (image != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.sp),
                    child: image,
                  ),

                // Name
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AutoSizeText(
                    '${name.tr} $label',
                    style: Get.textTheme.bodyLarge,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),

                // Sub Name
                if (subName != null && subName!.isNotEmpty)
                  Flexible(
                    child: AutoSizeText(
                      subName!.tr,
                      style: Get.textTheme.bodySmall,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (moreInformation != null)
          Padding(
            padding: EdgeInsetsDirectional.only(top: 5.sp, start: 5.sp),
            child: FlyInkWell(
              onTap: moreInformation,
              child: Icon(
                  UniconsSolid.exclamation_circle,
                  color: Get.theme.primaryColor,
                  size: 16.sp,
                ),
            ),
          )
      ],
    );
  }
}

class FlySelectorSVG extends StatelessWidget {
  const FlySelectorSVG({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$image',
      width: 40,
      height: 40,
    );
  }
}

class FlySelectorImage extends StatelessWidget {
  const FlySelectorImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$image',
      width: 40,
      height: 40,
    );
  }
}
