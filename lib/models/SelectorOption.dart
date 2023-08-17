import 'package:flutter/material.dart';

class SelectorOption {
  final String name;
  final String? subName;
  final Widget? image;
  final Function? moreInformation;

  SelectorOption({
    required this.name,
    this.subName,
    this.image,
    this.moreInformation,
  });
}
