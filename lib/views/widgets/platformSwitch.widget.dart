import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlyPlatformSwitch extends StatelessWidget {
  final bool? value;
  final Function? onChanged;

  const FlyPlatformSwitch({
    Key? key,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Switch(
            activeColor: Get.theme.primaryColor,
            inactiveTrackColor: Colors.white10,
            value: value!,
            onChanged: onChanged as void Function(bool)?,
          )
        : CupertinoSwitch(
            value: value!,
            onChanged: onChanged as void Function(bool)?,
            activeColor: Get.theme.primaryColor,
            trackColor: Colors.white10,
          );
  }
}
