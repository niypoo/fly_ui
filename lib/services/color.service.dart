import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class ColorService {
  // Static colors serve the primary
  static Color primaryLighten() => lighten(Get.theme.primaryColor, .005);
  static Color primaryLight() => lighten(Get.theme.primaryColor, .36);
  static Color primaryDark() => lighten(Get.theme.primaryColor, .1);
  static Color primaryDarken() => lighten(Get.theme.primaryColor, .2);

  static Color colorLighten(Color color) => lighten(color, .42);
  static Color colorLight(Color color) => lighten(color, .36);
  static Color colorDark(Color color) => lighten(color, .1);
  static Color colorDarken(Color color) => lighten(color, .2);

  //convert color hash code to dart color object
  static Color hashColorMake(String? hashCode) {
    if (hashCode is! String) return Colors.black;
    return Color(int.parse('0xff$hashCode'));
  }

  //get if color is dark or light
  static bool isColorLight(Color? color) {
    return color == null
        ? false
        : color.computeLuminance() > 0.5
            ? false
            : true;
  }

  ///Method to get a random color
  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
