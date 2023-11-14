import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../styles/app_styles.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';
import 'color_schemes.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(

      fillColor: lightColorScheme.secondary.withOpacity(.4),
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: lightColorScheme.secondary.withOpacity(.5),) , borderRadius: BorderRadius.all(Radius.circular(15))),
      enabledBorder:  OutlineInputBorder(borderSide: BorderSide(width: 1, color: lightColorScheme.secondary.withOpacity(.5),) , borderRadius: BorderRadius.all(Radius.circular(15))),

      focusedBorder:  OutlineInputBorder(borderSide: BorderSide(width: 1, color: lightColorScheme.secondary.withOpacity(.5),) , borderRadius: BorderRadius.all(Radius.circular(15))),

      labelStyle: TextStyles.instance.textRegular.copyWith(color: ColorsApp.instance.onPrimary),
      errorStyle: TextStyles.instance.textRegular.copyWith(color: ColorsApp.instance.error),
    ),
    // Defina a fonte desejada aqui
    textTheme: TextTheme(
      bodyLarge: TextStyles.instance.textRegular.copyWith(
        fontFamily: TextStyles.instance.fontFamily,
      ),
      bodyMedium: TextStyles.instance.textRegular.copyWith(
        fontFamily: TextStyles.instance.fontFamily,
      ),
      titleLarge: TextStyles.instance.textBold.copyWith(
        fontFamily: TextStyles.instance.fontFamily,
      ),
      displayLarge: TextStyles.instance.textBold.copyWith(
        fontSize: 28,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      displayMedium: TextStyles.instance.textBold.copyWith(
        fontSize: 24,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      displaySmall: TextStyles.instance.textBold.copyWith(
        fontSize: 20,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      headlineMedium: TextStyles.instance.textBold.copyWith(
        fontSize: 18,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      headlineSmall: TextStyles.instance.textBold.copyWith(
        fontSize: 14,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      titleMedium: TextStyles.instance.textRegular.copyWith(
        fontSize: 14,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      titleSmall: TextStyles.instance.textRegular.copyWith(
        fontSize: 12,
        fontFamily: TextStyles.instance.fontFamily,
      ),
      labelLarge: TextStyles.instance.textRegular.copyWith(
        fontFamily: TextStyles.instance.fontFamily,
      ),
      bodySmall: TextStyles.instance.textRegular.copyWith(
        fontFamily: TextStyles.instance.fontFamily,
      ),
      labelSmall: TextStyles.instance.textRegular.copyWith(
        fontFamily: TextStyles.instance.fontFamily,
      ),
    ),

  );
}
