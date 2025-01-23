import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:fly_ui/views/widgets/inkWell.widget.dart';

class FlyListTile extends StatelessWidget {
  const FlyListTile({
    Key? key,
    required this.title,
    this.value,
    this.onTap,
    this.onLongPress,
    this.trailing,
    this.leading,
    this.bgColor,
    this.outline = false,
  }) : super(key: key);

  final String title;
  final String? value;
  final Widget? trailing;
  final Widget? leading;
  final Function? onTap;
  final Function? onLongPress;
  final Color? bgColor;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return FlyInkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: FlyInputTileWrap(
        title: title,
        subtitle: value,
        trailing: trailing,
        leading: leading,
        outline: outline,
        bgColor: bgColor,
      ),
    );
  }
}
