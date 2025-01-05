import 'package:bottom_sheet_helper/services/conformationSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyTagsInputTile extends StatefulWidget {
  const FlyTagsInputTile({
    Key? key,
    required this.title,
    required this.tags,
    this.outline = false,
    this.bgColor,
    this.child,
    this.allowDuplicates = false,
  }) : super(key: key);

  final String title;
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
      leading: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: FlyTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a value'.tr;
            }
            if (widget.tags.contains(value)) {
              return 'Value already exists'.tr;
            }
            return null;
          },
          contentPaddingVertical: 6.sp,
          borderColor: widget.outline
              ? Get.theme.scaffoldBackgroundColor
              : Get.theme.cardColor,
          controller: _controller,
          hintText: widget.title,
          onFieldSubmitted: addTag,
        ),
      ),
      title: widget.title,
      outline: widget.outline,
      bgColor: widget.bgColor,
      trailing: FlyIconButton.card(
        icon: Icons.add,
        onPressed: () => addTag(_controller.text),
      ),
      child: widget.tags.isEmpty
          ? null
          : Wrap(
              children: widget.tags
                  .map((tag) => FlyChip(
                        tag: tag,
                        onRemove: () => removeTag(tag),
                      ))
                  .toList(),
            ),
    );
  }
}

class FlyChip extends StatelessWidget {
  const FlyChip({super.key, required this.tag, this.onRemove});
  final String tag;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 5.sp),
      child: Chip(
        onDeleted: onRemove,
        deleteIcon: Icon(
          UniconsLine.times,
          size: 15.sp,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        padding: EdgeInsets.all(4.sp),
        backgroundColor: Get.theme.cardColor,
        labelPadding: EdgeInsets.symmetric(horizontal: 2.sp),
        label: Text(
          tag,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ), //Text
      ),
    );
  }
}
