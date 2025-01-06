import 'dart:async';

import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/autocomplete.widget.dart';
import 'package:fly_ui/views/widgets/chip.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';

class FlyTagsInputTile extends StatefulWidget {
  const FlyTagsInputTile(
      {Key? key,
      required this.placeholder,
      required this.tags,
      this.outline = false,
      this.bgColor,
      this.child,
      this.onChange,
      this.allowDuplicates = false,
      this.autocomplete})
      : super(key: key);

  final String placeholder;
  final RxList<String> tags;
  final bool outline;
  final Color? bgColor;
  final Widget? child;
  final bool allowDuplicates;
  final Function(List<String>)? onChange;
  final FutureOr<Iterable<String>> Function(String)? autocomplete;

  @override
  State<FlyTagsInputTile> createState() => _FlyCheckboxTileState();
}

class _FlyCheckboxTileState extends State<FlyTagsInputTile> {
  late TextEditingController _controller;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _controller = TextEditingController();
    _formKey = GlobalKey();
    super.initState();
  }

  void addTag(String tag) {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      widget.tags.add(tag);
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
    if (confirmation == false) return;

    setState(() {
      // remove the tag
      widget.tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      padding: const EdgeInsets.all(0),
      leading: Form(
        key: _formKey,
        child: FlyAutocomplete(
          placeholder: widget.placeholder,
          search: widget.autocomplete,
          onSelected: addTag,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a value'.tr;
            }
            if (widget.tags.contains(value)) {
              return 'Value already exists'.tr;
            }
            return null;
          },
        ),
      ),
      title: widget.placeholder,
      outline: widget.outline,
      bgColor: widget.bgColor,
      child: widget.tags.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Wrap(
                children: widget.tags
                    .map((tag) => FlyChip(
                          tag: tag,
                          onRemove: () => removeTag(tag),
                        ))
                    .toList(),
              ),
            )
          : null,
    );
  }
}
