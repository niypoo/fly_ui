import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HasSearchInput {
  // search text controller
  late TextEditingController searchTextController;

  late FocusNode searchFocusNode;

  // search input is empty
  late RxBool searchIsEmpty;

  //
  // dynamic query();
  void onFieldSubmitted(String value);
  void onSearchFieldClear();
  // void onResultTap(dynamic result);
}
