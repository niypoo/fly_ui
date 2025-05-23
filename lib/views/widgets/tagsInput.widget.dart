import 'dart:async';
import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/chip.widget.dart';
import 'package:fly_ui/views/widgets/selectAutocompleteInput.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';

class FlyTagsInput extends StatefulWidget {
  const FlyTagsInput({
    Key? key,
    required this.placeholder,
    required this.selectedValues,
    this.outline = true,
    this.validator,
    this.onChange,
    this.allowDuplicates = false,
    this.autocomplete,
    this.formKey,
    // this.focusNode,
    this.constantlyFocused = true, this.customOptions,
    // this.controller,
  }) : super(key: key);

  final String placeholder;
  final RxList<String> selectedValues;
  final String? Function(String?)? validator;
  final bool outline;
  final bool constantlyFocused;
  final bool allowDuplicates;
  final Function(List<String>)? onChange;
  final Function(TextEditingController controller, FocusNode focusNode)?
      customOptions;
  final FutureOr<Iterable<String>> Function(String)? autocomplete;
  final GlobalKey<FormState>? formKey;
  // final TextEditingController? controller;
  // final FocusNode? focusNode;

  @override
  State<FlyTagsInput> createState() => _FlyCheckboxTileState();
}

class _FlyCheckboxTileState extends State<FlyTagsInput> {
  late TextEditingController _controller;
  late GlobalKey<FormState> _formKey;
  late FocusNode _focusNode;

  @override
  void initState() {
    _formKey = widget.formKey ?? GlobalKey();

    super.initState();
  }

  void addTag(String tag) {
    if (!_formKey.currentState!.validate()) return;
    widget.selectedValues.add(tag.trim());
    _controller.clear();

    // when Constantly Focused is turn on
    if (widget.constantlyFocused) _focusNode.requestFocus();
  }

  Future<void> removeTag(String tag) async {
    // show confirmation dialog
    final dynamic confirmation = await ConformationSheetHelper.show(
      title: 'Confirm'.tr,
      subTitle: 'Are you sure you want to delete this value?'.tr,
    );
    // skip if user cancel the confirmation
    if (confirmation == null || confirmation == false) return;

    // remove the tag
    widget.selectedValues.remove(tag);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => Autocomplete<String>(
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
              //assignment controller and focus;
              _controller = textEditingController;
              _focusNode = focusNode;

              // trigger customOptions
              if (widget.customOptions != null) {
                widget.customOptions!(textEditingController, _focusNode);
              }

              return Form(
                key: _formKey,
                child: FlyTextField(
                  marginBottom: widget.selectedValues.isNotEmpty ? 0 : 6,
                  color: widget.outline ? null : Get.theme.cardColor,
                  validator: widget.validator ??
                      (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value'.tr;
                        }
                        if (widget.selectedValues.contains(value)) {
                          return 'Value already exists'.tr;
                        }
                        return null;
                      },
                  controller: _controller,
                  focusNode: _focusNode,
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
            optionsViewBuilder: (context, onSelected, options) {
              return AutoCompleteOptionsViewBuilder(
                  constraints: constraints,
                  options: options,
                  onSelected: onSelected);
            },
            //Add other Parameters you want.
            onSelected: addTag,
          ),
        ),
        Obx(
          () => widget.selectedValues.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(bottom: 6.sp),
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
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
