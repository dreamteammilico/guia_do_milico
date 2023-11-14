import 'package:flutter/material.dart';

import '../theme/color_schemes.dart';
import 'colors_app.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  AppStyles._();
  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: lightColorScheme.primary,
        textStyle: TextStyles.instance.textButtonLabel,
      );



  ButtonStyle get errorButton => ElevatedButton.styleFrom(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    backgroundColor: lightColorScheme.error,
    textStyle: TextStyles.instance.textButtonLabel,
  );
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}