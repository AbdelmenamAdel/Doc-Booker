import 'package:flutter/material.dart';
import 'package:markaz_elamal/core/styles/colors/colors_dark.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';
import 'package:markaz_elamal/core/styles/fonts/font_family_helper.dart';
import 'package:markaz_elamal/core/styles/fonts/font_size_helper.dart';
import 'package:markaz_elamal/core/styles/fonts/font_weight_helper.dart';
import 'package:markaz_elamal/core/styles/theme/color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    // extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 16,
        color: ColorsDark.white,
        // fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.white,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
    useMaterial3: true,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: FontSizeHelper.font20,
        color: ColorsLight.mainColor,
        fontWeight: FontWeightHelper.medium,
        fontFamily: FontFamilyHelper.poppinsEnglish,
      ),
      bodyLarge: TextStyle(
        fontSize: FontSizeHelper.font24,
        color: ColorsLight.mainColor,
        fontWeight: FontWeightHelper.bold,
        fontFamily: FontFamilyHelper.poppinsEnglish,
      ),
      bodySmall: TextStyle(
        fontSize: FontSizeHelper.font16,
        color: ColorsLight.secondaryColor,
        fontWeight: FontWeightHelper.regular,
        fontFamily: FontFamilyHelper.poppinsEnglish,
      ),
    ),
  );
}
