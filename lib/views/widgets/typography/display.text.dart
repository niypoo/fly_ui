import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:patata_responsive/patata_responsive.dart';

class DisplayText extends StatelessWidget {
  const DisplayText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w100),
    );
  }
}
