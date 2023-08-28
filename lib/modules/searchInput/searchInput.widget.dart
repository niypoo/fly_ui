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
    this.placeholder = 'Search...',
  }) : super(key: key);

  final HasSearchInput controller;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return FlyTextField(
            focusNode: controller.searchFocusNode,
            textInputAction: TextInputAction.search,
            textInputType: TextInputType.text,
            padding: AppConfigService.to.space!.xxs,
            controller: controller.searchTextController,
            onFieldSubmitted: controller.onFieldSubmitted,
            color: Get.theme.cardColor,
            borderColor: Colors.transparent,
            hintText: placeholder.tr,
            suffix: controller.searchIsEmpty.value
                ? const Icon(
                    UniconsLine.search,
                  )
                : IconButton(
                    onPressed: controller.onSearchFieldClear,
                    icon: const Icon(
                      UniconsLine.times,
                    ),
                  )
            // focusNode: focusNode,
            );
      },
    );
  }
}
