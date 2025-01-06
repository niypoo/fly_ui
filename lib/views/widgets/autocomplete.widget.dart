import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';

class FlyAutocomplete extends StatefulWidget {
  const FlyAutocomplete({
    super.key,
    required this.placeholder,
    required this.search,
    required this.onSelected,
    this.validator,
    this.outline = true,
  });

  final String? Function(String?)? validator;
  final bool outline;
  final String placeholder;
  final Function(String selection) onSelected;
  final FutureOr<Iterable<String>> Function(String)? search;

  @override
  State<FlyAutocomplete> createState() => _FlyAutocompleteState();
}

class _FlyAutocompleteState extends State<FlyAutocomplete> {
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
          // marginBottom: 0,
          // marginTop: 0,
          validator: widget.validator,
          borderColor: widget.outline
              ? Get.theme.scaffoldBackgroundColor
              : Get.theme.cardColor,
          controller: textEditingController,
          focusNode: focusNode,
          hintText: widget.placeholder,
          onFieldSubmitted: (value) => onFieldSubmitted,
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) async {
        // skip
        if (textEditingValue.text == '' || widget.search == null) return const Iterable<String>.empty();

        // trigger search api after debounce
          return await widget.search!(textEditingValue.text);
        
      },
      //Add other Parameters you want.
      onSelected: widget.onSelected,
    );
  }
}
