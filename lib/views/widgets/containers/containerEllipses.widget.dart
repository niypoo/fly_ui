import 'package:app_config/appInfo.config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';

class FlyContainerEllipses extends StatefulWidget {
  const FlyContainerEllipses({
    Key? key,
    required this.title,
    required this.child,
    this.icon,
    this.bgColor,
    this.textColor,
    this.ellipse = false,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final Widget child;
  final bool ellipse;

  @override
  _FlyContainerEllipsesState createState() => _FlyContainerEllipsesState();
}

class _FlyContainerEllipsesState extends State<FlyContainerEllipses> {
  bool ellipse = false;

  @override
  void initState() {
    ellipse = widget.ellipse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlyContainer(
      color: widget.bgColor ?? Get.theme.cardColor,
      margin: EdgeInsets.only(bottom: AppConfigService.to.space!.m),
      child: Column(
        children: [
          // Title
          Row(
            children: [
              if (widget.icon != null) Icon(widget.icon),
              Expanded(
                child: AutoSizeText(
                  widget.title,
                  style: Get.textTheme.labelLarge!.copyWith(
                    color: widget.textColor,
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                onPressed: () {
                  setState(() {
                    ellipse = !ellipse;
                  });
                },
                icon: Icon(
                  ellipse
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                ),
              )
            ],
          ),

          if (ellipse) SizedBox(height: AppConfigService.to.space!.m),

          Visibility(visible: ellipse, child: widget.child),
        ],
      ),
    );
  }
}
