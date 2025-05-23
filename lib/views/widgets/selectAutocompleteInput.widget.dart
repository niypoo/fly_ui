import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
        optionsViewBuilder: (context, onSelected, options) {
          return AutoCompleteOptionsViewBuilder(constraints: constraints, options: options, onSelected: onSelected);
        },
        //Add other Parameters you want.
        onSelected: widget.onSelected,
      ),
    );
  }
}

class AutoCompleteOptionsViewBuilder extends StatelessWidget {
  const AutoCompleteOptionsViewBuilder({
    super.key,
    required this.constraints,
    required this.options,
    required this.onSelected,
  });
  final BoxConstraints constraints;
  final void Function(String) onSelected;
  final Iterable<String> options;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: constraints.maxWidth,
        child: Material(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          color: Get.theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: options.map((e) {
              return ListTile(
                title: Text(e, style: Get.textTheme.labelLarge,),
                onTap: () => onSelected(e),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
