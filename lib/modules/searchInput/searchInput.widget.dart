import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/modules/searchInput/abstracts/hasSearchInput.abstract.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlySearchInput extends StatelessWidget {
  const FlySearchInput({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.suffix,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final HasSearchInput controller;
  final String placeholder;
  final TextInputType textInputType;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return FlyTextField(
            focusNode: controller.searchFocusNode,
            textInputAction: TextInputAction.search,
            controller: controller.searchTextController,
            onFieldSubmitted: controller.onFieldSubmitted,
            color: Get.theme.cardColor,
            borderColor: Colors.transparent,
            hintText: placeholder,
            suffix: controller.searchIsEmpty.isTrue
                ? suffix ??
                    const FlyIconButton(
                      onPressed: null,
                      icon: UniconsLine.search,
                    )
                : FlyIconButton(
                    onPressed: controller.onSearchFieldClear,
                    icon: UniconsLine.search,
                  )
            // focusNode: focusNode,
            );
      },
    );
  }
}
