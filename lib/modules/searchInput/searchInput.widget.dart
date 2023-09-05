import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/modules/searchInput/abstracts/hasSearchInput.abstract.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlySearchInput extends StatelessWidget {
  const FlySearchInput({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final HasSearchInput controller;
  final String placeholder;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return FlyTextField(
            focusNode: controller.searchFocusNode,
            textInputAction: TextInputAction.search,
            textInputType: TextInputType.text,
            controller: controller.searchTextController,
            onFieldSubmitted: controller.onFieldSubmitted,
            color: Get.theme.cardColor,
            borderColor: Colors.transparent,
            hintText: placeholder,
            suffix: controller.searchIsEmpty.value
                ? Icon(
                    UniconsLine.search,
                    color: Get.iconColor!.withOpacity(0.3),
                  )
                : IconButton(
                    onPressed: controller.onSearchFieldClear,
                    icon: Icon(
                      UniconsLine.times,
                      color: Get.iconColor!.withOpacity(0.3),
                    ),
                  )
            // focusNode: focusNode,
            );
      },
    );
  }
}
