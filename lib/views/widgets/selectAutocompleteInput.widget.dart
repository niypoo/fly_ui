import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
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
          validator: widget.validator,
          color: widget.outline ? null : Get.theme.cardColor,
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
      optionsViewBuilder: (context, onAutoCompleteSelect, options) {
        return Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: Theme.of(context).primaryColorLight,
              elevation: 4.0,
              // size works, when placed here below the Material widget
              child: Container(
                  // I have the text field wrapped in a container with
                  // EdgeInsets.all(20) so subtract 40 from the width for the width
                  // of the text box. You could also just use a padding widget
                  // with EdgeInsets.only(right: 20)
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: options.length,
                    separatorBuilder: (context, i) {
                      return Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      // some child here
                    },
                  )),
            ));
      },
      //Add other Parameters you want.
      onSelected: widget.onSelected,
    );
  }
}
