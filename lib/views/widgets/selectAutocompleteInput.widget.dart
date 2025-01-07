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
    return LayoutBuilder(
      builder: (context, constraints) => Autocomplete<String>(
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
        optionsViewBuilder: (context, onSelected, options) => Align(
          alignment: Alignment.topLeft,
          child: Material(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
            ),
            child: Container(
              height: 52.0 * options.length,
              width: constraints.biggest.width, // <-- Right here !
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(option),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(option),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        //Add other Parameters you want.
        onSelected: widget.onSelected,
      ),
    );
  }
}
