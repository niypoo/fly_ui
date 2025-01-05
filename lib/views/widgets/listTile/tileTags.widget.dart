import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class FlyCheckboxTile extends StatefulWidget {
  const FlyCheckboxTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.value,
    this.subtitle,
    this.outline = false,
    this.bgColor,
    this.child,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool value;
  final Function onTap;
  final bool outline;
  final Color? bgColor;
  final Widget? child;

  @override
  State<FlyCheckboxTile> createState() => _FlyCheckboxTileState();
}

class _FlyCheckboxTileState extends State<FlyCheckboxTile> {
  final List<String> tags = [];

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
    });
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      leading: FlyTextField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text'.tr;
          }
          return null;
        },
        controller: _controller,
        decoration: const InputDecoration(
          label: Text('Enter your tags'),
        ),
      ),
      title: widget.title,
      subtitle: widget.subtitle,
      outline: widget.outline,
      bgColor: widget.bgColor,
      trailing: FlyIconButton.primary(
        icon: Icons.add,
        onPressed: () {
          if (_controller.text.isEmpty) return;
          print('Add tags');
          addTag(_controller.text);
        },
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
      avatar: Container(
        width: 10.sp,
        decoration: BoxDecoration(
          color: Get.theme.hoverColor,
          shape: BoxShape.circle,
        ),
      ),
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
