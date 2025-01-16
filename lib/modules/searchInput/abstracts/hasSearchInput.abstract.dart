import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HasSearchInput {
  // search text controller
  late TextEditingController searchTextController;

  late FocusNode searchFocusNode;

  // search input is empty
  late RxBool searchIsEmpty;

  void onFieldSubmitted(String? value);
  void onFieldChanges(String? value);
  void onSearchFieldClear();
}
