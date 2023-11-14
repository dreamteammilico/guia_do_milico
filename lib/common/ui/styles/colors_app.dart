import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  // Light Color Scheme
  Color get primary => Color(0xFFF4CA59);
  Color get onPrimary => Color(0xFFFFFFFF);
  Color get onPrimaryHint => Color(0xFFC5C5C5);
  Color get card => Color.fromRGBO(89, 102, 126, 1.0);
  Color get primaryContainer => Color(0xFFCEE5FF);
  Color get link => Color(0xFF3692FA);
  Color get onPrimaryContainer => Color(0xFF001D33);
  Color get secondary => Color(0xFF51606F);
  Color get onSecondary => Color(0xFFFFFFFF);
  Color get secondaryContainer => Color(0xFFD5E4F7);
  Color get onSecondaryContainer => Color(0xFF0E1D2A);
  Color get tertiary => Color(0xFF68587A);
  Color get onTertiary => Color(0xFFFFFFFF);
  Color get tertiaryContainer => Color(0xFFEFDBFF);
  Color get onTertiaryContainer => Color(0xFF231533);
  Color get red => Color(0xFFF30101);
  Color get error => Color(0xFFBA1A1A);
  Color get errorContainer => Color(0xFFFFDAD6);
  Color get onError => Color(0xFFFFFFFF);
  Color get onErrorContainer => Color(0xFF410002);
  Color get background => Color(0xFF131E25);
  Color get backgroundInit => Color(0xFF27323A);
  Color get onBackground => Color(0xFF1A1C1E);
  Color get surface => Color(0xFFFCFCFF);
  Color get onSurface => Color(0xFF1A1C1E);
  Color get surfaceVariant => Color(0xFFDEE3EB);
  Color get onSurfaceVariant => Color(0xFF42474E);
  Color get outline => Color(0xFF72777F);
  Color get onInverseSurface => Color(0xFFF1F0F4);
  Color get inverseSurface => Color(0xFF2F3033);
  Color get inversePrimary => Color(0xFF97CBFF);
  Color get shadow => Color(0xFF000000);
  Color get surfaceTint => Color(0xFF00639B);
  Color get outlineVariant => Color(0xFFC2C7CF);
  Color get scrim => Color(0xFF000000);

  // Dark Color Scheme
  Color get darkPrimary => Color(0xFF97CBFF);
  Color get darkOnPrimary => Color(0xFF003353);
  Color get darkPrimaryContainer => Color(0xFF004A76);
  Color get darkOnPrimaryContainer => Color(0xFFCEE5FF);
  Color get darkSecondary => Color(0xFFB9C8DA);
  Color get darkOnSecondary => Color(0xFF243240);
  Color get darkSecondaryContainer => Color(0xFF3A4857);
  Color get darkOnSecondaryContainer => Color(0xFFD5E4F7);
  Color get darkTertiary => Color(0xFFD3BFE6);
  Color get darkOnTertiary => Color(0xFF392A49);
  Color get darkTertiaryContainer => Color(0xFF504061);
  Color get darkOnTertiaryContainer => Color(0xFFEFDBFF);
  Color get darkError => Color(0xFFFFB4AB);
  Color get darkErrorContainer => Color(0xFF93000A);
  Color get darkOnError => Color(0xFF690005);
  Color get darkOnErrorContainer => Color(0xFFFFDAD6);
  Color get darkBackground => Color(0xFF1A1C1E);
  Color get darkOnBackground => Color(0xFFE2E2E5);
  Color get darkSurface => Color(0xFF1A1C1E);
  Color get darkOnSurface => Color(0xFFE2E2E5);
  Color get darkSurfaceVariant => Color(0xFF42474E);
  Color get darkOnSurfaceVariant => Color(0xFFC2C7CF);
  Color get darkOutline => Color(0xFF8C9198);
  Color get darkOnInverseSurface => Color(0xFF1A1C1E);
  Color get darkInverseSurface => Color(0xFFE2E2E5);
  Color get darkInversePrimary => Color(0xFF00639B);
  Color get darkShadow => Color(0xFF000000);
  Color get darkSurfaceTint => Color(0xFF97CBFF);
  Color get darkOutlineVariant => Color(0xFF42474E);
  Color get darkScrim => Color(0xFF000000);


  BoxDecoration get primaryGradient => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFF4CA59), Color(0xFFE0952D)],
    ),
  );

  BoxDecoration get secondaryGradient => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF51606F), Color(0xFF39414E)],
    ),
  );




}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
