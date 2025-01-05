import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/chip.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyTagsInputTile extends StatefulWidget {
  const FlyTagsInputTile({
    Key? key,
    required this.title,
    this.subtitle,
    required this.tags,
    this.outline = false,
    this.bgColor,
    this.child,
    this.allowDuplicates = false,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final RxList<String> tags;
  final bool outline;
  final Color? bgColor;
  final Widget? child;
  final bool allowDuplicates;

  @override
  State<FlyTagsInputTile> createState() => _FlyCheckboxTileState();
}

class _FlyCheckboxTileState extends State<FlyTagsInputTile> {
  late TextEditingController _controller;
  String? validatorError;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  void addTag(String tag) {
    setState(() {
      validatorError = validator(tag);
      if (validatorError != null) return;
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

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value'.tr;
    }
    if (!widget.allowDuplicates && widget.tags.contains(value)) {
      return 'This value already exists'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      leading: FlyTextField(
        contentPaddingVertical: 6.sp,
        borderColor: widget.outline
            ? Get.theme.scaffoldBackgroundColor
            : Get.theme.cardColor,
        controller: _controller,
        hintText: widget.title,
        onFieldSubmitted: addTag,
      ),
      title: widget.title,
      outline: widget.outline,
      bgColor: widget.bgColor,
      trailing: FlyIconButton.card(
        size: 20.sp,
        icon: Icons.add,
        onPressed: () => addTag(_controller.text),
      ),
      child: validatorError != null || widget.tags.isNotEmpty
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (validatorError != null)
                  Text(
                    validatorError!,
                    style:
                        Get.textTheme.labelSmall!.copyWith(color: Colors.red),
                  ),
                if (widget.tags.isNotEmpty)
                  Wrap(
                    children: widget.tags
                        .map(
                          (tag) => FlyChip(
                            tag: tag,
                            onRemove: () => removeTag(tag),
                          ),
                        )
                        .toList(),
                  ),
              ],
            )
          : null,
    );
  }
}
