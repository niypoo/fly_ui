import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:patata_responsive/patata_responsive.dart';

class TitleMediumText extends StatelessWidget {
  const TitleMediumText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
    );
  }
}
