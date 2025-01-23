import 'package:flutter/material.dart';
import 'package:markaz_elamal/core/styles/colors/colors_dark.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.textColor,
  });

  final Color? mainColor;
  final Color? textColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? textColor,
  }) {
    return MyColors(
      mainColor: mainColor,
      textColor: textColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      textColor: textColor,
    );
  }

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
    textColor: ColorsDark.white,
  );

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
    textColor: ColorsLight.black,
  );
}
