import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';

class FlyFloatingButton extends StatelessWidget {
  const FlyFloatingButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.bgColor,
    this.iconColor,
  }) : super(key: key);

  final Function onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: FlyIconButton(
        padding: EdgeInsets.all(AppConfigService.to.space!.xs),
        icon: icon,
        bgColor: bgColor,
        colorIcon: iconColor,
        onPressed: onTap,
      ),
    );
  }
}
