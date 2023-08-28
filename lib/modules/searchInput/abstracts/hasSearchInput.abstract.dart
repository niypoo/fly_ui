import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HasSearchInput {
  // contractor
  HasSearchInput() {
    // Handle Search input actions
    searchTextController.addListener(
      () {
        // Value os search input
        searchIsEmpty.value = searchTextController.text.trim().isEmpty;
      },
    );

    print('[HasSearchInput .... ((((instantiated))))]');
  }

  // search text controller
  late TextEditingController searchTextController;

  late FocusNode searchFocusNode;

  // search input is empty
  late RxBool searchIsEmpty;

  void onFieldSubmitted(String value);
  void onSearchFieldClear();
}
