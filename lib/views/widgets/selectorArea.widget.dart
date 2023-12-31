import 'package:app_configuration_service/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/models/SelectorOption.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:fly_ui/views/widgets/containers/continerColored.widget.dart';
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
      margin: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
      padding: EdgeInsets.all(AppConfigService.to.space!.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          if (title != null)
            Padding(
              padding: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
              child: Row(
                children: [
                  AutoSizeText(
                    title!,
                    style: Get.textTheme.labelLarge!.copyWith(color: textColor),
                  ),
                ],
              ),
            ),

          Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: options.map((option) {
              // is selected
              final bool isSelected =
                  describeEnum(selectedOption) == option.name;

              // return widget
              return FlySelectorOption(
                color: color,
                label: label,
                selectedColor: Get.theme.colorScheme.secondary,
                name: option.name,
                subName: option.subName,
                image: option.image,
                moreInformation: option.moreInformation,
                isSelected: isSelected,
                onTap: () => onTap(option.name),
              );
            }).toList(),
          ),
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisSpacing: 5,
          //     mainAxisSpacing: 5,
          //     crossAxisCount: crossAxisCount ?? (context.isTablet ? 3 : 2),
          //     mainAxisExtent: 120,
          //   ),
          //   itemCount: options.length,
          //   itemBuilder: (context, index) {
          //     final SelectorOption option = options[index];
          //   },
          // ),
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
          borderRadius: BorderRadius.circular(10.sp),
          onTap: onTap as void Function()?,
          child: FlyContainerColored(
            width: 110,
            height: 120,
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
                    padding:
                        EdgeInsets.only(bottom: AppConfigService.to.space!.s),
                    child: image,
                  ),

                // Name
                AutoSizeText(
                  '${name.tr} $label',
                  style: Get.textTheme.bodyLarge,
                  maxLines: 1,
                  textAlign: TextAlign.center,
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: FlyIconButton(
              bgColor: Get.theme.cardColor,
              padding: const EdgeInsets.all(0),
              icon: UniconsLine.exclamation,
              onPressed: moreInformation,
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
