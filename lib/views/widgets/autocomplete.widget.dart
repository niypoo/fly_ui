import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';

class FlySelectAutocompleteInput extends StatefulWidget {
  const FlySelectAutocompleteInput({
    super.key,
    required this.placeholder,
    required this.autocomplete,
    required this.onSelected,
    this.initialValue,
    this.validator,
    this.suffix = const [],
    this.outline = true,
  });

  final String? Function(String?)? validator;
  final bool outline;
  final String placeholder;
  final String? initialValue;
  final List<Widget> suffix;
  final Function(String selection) onSelected;
  final FutureOr<Iterable<String>> Function(String)? autocomplete;

  @override
  State<FlySelectAutocompleteInput> createState() => _FlyAutocompleteState();
}

class _FlyAutocompleteState extends State<FlySelectAutocompleteInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return FlyTextField(
          initialValue: widget.initialValue,
          marginBottom: 0,
          marginTop: 0,
          validator: widget.validator,
          color: widget.outline ? null : Get.theme.cardColor,
          borderColor: widget.outline
              ? Get.theme.scaffoldBackgroundColor
              : Get.theme.cardColor,
          controller: textEditingController,
          focusNode: focusNode,
          hintText: widget.placeholder,
          onFieldSubmitted: (value) => onFieldSubmitted,
          suffix: widget.suffix,
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) async {
        // skip
        if (textEditingValue.text == '' || widget.autocomplete == null) {
          return const Iterable<String>.empty();
        }

        // trigger search api after debounce
        return await widget.autocomplete!(textEditingValue.text);
      },
      //Add other Parameters you want.
      onSelected: widget.onSelected,
    );
  }
}
