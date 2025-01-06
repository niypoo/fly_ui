import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/autocomplete.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';

class FlyRadioListTile extends StatelessWidget {
  const FlyRadioListTile({
    Key? key,
    required this.onSelected,
    required this.title,
    required this.value,
    required this.selectedValue,
    this.subtitle,
    this.bgColor,
    this.child,
    this.autocomplete,
    this.validator,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final dynamic value;
  final dynamic selectedValue;
  final dynamic Function(String) onSelected;
  final String? subtitle;
  final bool outline;
  final Color? bgColor;
  final Widget? child;
  final String? Function(String?)? validator;
  final FutureOr<Iterable<String>> Function(String)? autocomplete;

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      leading: FlyAutocomplete(
        placeholder: title,
        search: autocomplete,
        onSelected: onSelected,
        validator: validator,
      ),
      title: title,
      outline: outline,
      bgColor: bgColor,
      child: child,
    );
  }
}
