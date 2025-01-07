import 'dart:async';
import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/chip.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';

class FlyTagsInput extends StatefulWidget {
  const FlyTagsInput({
    Key? key,
    required this.placeholder,
    required this.selectedValues,
    this.outline = false,
    this.validator,
    this.onChange,
    this.allowDuplicates = false,
    this.autocomplete,
  }) : super(key: key);

  final String placeholder;
  final RxList<String> selectedValues;
  final String? Function(String?)? validator;
  final bool outline;
  final bool allowDuplicates;
  final Function(List<String>)? onChange;
  final FutureOr<Iterable<String>> Function(String)? autocomplete;

  @override
  State<FlyTagsInput> createState() => _FlyCheckboxTileState();
}

class _FlyCheckboxTileState extends State<FlyTagsInput> {
  late TextEditingController _controller;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  void addTag(String tag) {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      widget.selectedValues.add(tag);
      _controller.clear();
    });
  }

  Future<void> removeTag(String tag) async {
    // show confirmation dialog
    final dynamic confirmation = await ConformationSheetHelper.show(
      title: 'Confirm'.tr,
      subTitle: 'Are you sure you want to delete this value?'.tr,
    );
    // skip if user cancel the confirmation
    if (confirmation == null || confirmation == false) return;

    setState(() {
      // remove the tag
      widget.selectedValues.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Autocomplete<String>(
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            _controller = textEditingController;
            return Form(
              key: _formKey,
              child: FlyTextField(
                color: widget.outline ? null : Get.theme.cardColor,
                validator: widget.validator,
                controller: textEditingController,
                focusNode: focusNode,
                hintText: widget.placeholder,
                onFieldSubmitted: addTag,
              ),
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
          onSelected: addTag,
        ),
        if (widget.selectedValues.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Wrap(
              children: widget.selectedValues
                  .map((tag) => FlyChip(
                        tag: tag,
                        backgroundColor: widget.outline
                            ? null
                            : Get.theme.scaffoldBackgroundColor,
                        onRemove: () => removeTag(tag),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
