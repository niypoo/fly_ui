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
    this.tags = const [],
    this.outline = false,
    this.bgColor,
    this.child,
  }) : super(key: key);

  final String title;
  final List<String> tags;
  final bool outline;
  final Color? bgColor;
  final Widget? child;

  @override
  State<FlyTagsInputTile> createState() => _FlyCheckboxTileState();
}

class _FlyCheckboxTileState extends State<FlyTagsInputTile> {
  List<String> tags = [];

  onInit() {
    tags = widget.tags;
  }

  void addTag(String tag) {
    if (_formKey.currentState!.isValid) return;
    setState(() {
      tags.add(tag);
      _controller.clear();
    });
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormFieldState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      leading: FlyTextField(
        key: _formKey,
        controller: _controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text'.tr;
          }
          return null;
        },
        labelText: 'Enter your tags',
        onFieldSubmitted: addTag,
      ),
      title: widget.title,
      outline: widget.outline,
      bgColor: widget.bgColor,
      trailing: FlyIconButton.card(
        icon: Icons.add,
        onPressed: () => addTag(_controller.text),
      ),
      child: Wrap(
        children: tags.map((tag) => FlyChip(tag: tag)).toList(),
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
    return Chip(
      onDeleted: onRemove,
      deleteIcon: const Icon(
        UniconsLine.times_circle,
        size: 15,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      padding: EdgeInsets.all(4.sp),
      backgroundColor: Get.theme.cardColor,
      labelPadding: EdgeInsets.symmetric(horizontal: 2.sp),
      label: Text(
        'Tags',
        style: Get.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ), //Text
    );
  }
}
