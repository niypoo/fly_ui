import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyListTileStep extends StatelessWidget {
  const FlyListTileStep({
    Key? key,
    required this.step,
    required this.title,
    this.description,
    this.contentPadding = const EdgeInsets.all(0),
  }) : super(key: key);

  final String step;
  final String title;
  final String? description;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding,
      leading: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Text(
          step,
          style: Get.textTheme.titleSmall,
        )),
      ),
      title: Text(
        title,
        style: Get.textTheme.bodyMedium
      ),
      subtitle: description != null
          ? Text(
              description!,
              style: Get.textTheme.bodySmall
            )
          : null,
    );
  }
}
