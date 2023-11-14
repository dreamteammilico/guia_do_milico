import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get fontFamily => GoogleFonts.chakraPetch().fontFamily!;

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: fontFamily);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontSize: 14, fontFamily: fontFamily, color: ColorsApp.instance.primary);

  TextStyle get textLink =>
      TextStyle(fontWeight: FontWeight.normal, fontSize: 14, fontFamily: fontFamily, color: ColorsApp.instance.link);


  TextStyle get textRegularWhite =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 14, fontFamily: fontFamily, color: ColorsApp.instance.onPrimary);

  TextStyle get textRegularHint =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 14, fontFamily: fontFamily, color: ColorsApp.instance.onPrimaryHint);

  TextStyle get textRegularCard =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 14, fontFamily: fontFamily, color: ColorsApp.instance.card);

  TextStyle get textMediumWhite =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 18, fontFamily: fontFamily, color: ColorsApp.instance.onPrimary);


  TextStyle get textRegularDark =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 14, fontFamily: fontFamily, color: ColorsApp.instance.onPrimaryContainer);

  TextStyle get textSmallWhite =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 9, fontFamily: fontFamily, color: ColorsApp.instance.onPrimary);

  TextStyle get textSmall =>
      TextStyle(fontWeight: FontWeight.normal, fontSize: 11, fontFamily: fontFamily, color: ColorsApp.instance.primary);


  TextStyle get textSmall2White =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 11, fontFamily: fontFamily, color: ColorsApp.instance.onPrimary);

  TextStyle get textSmallDark =>
      TextStyle(fontWeight: FontWeight.normal,  fontSize: 12, fontFamily: fontFamily, color: ColorsApp.instance.background);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500,fontSize: 16, fontFamily: fontFamily);

  TextStyle get textMediumBold =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: fontFamily);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: fontFamily);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: fontFamily);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: fontFamily);

  TextStyle get textTitleAppbar =>
      TextStyle(fontWeight: FontWeight.bold,  fontSize: 16, fontFamily: fontFamily, color: ColorsApp.instance.backgroundInit);


  TextStyle get textButtonLabelWhite => textBold.copyWith(fontSize: 14, color: ColorsApp.instance.onPrimary, fontFamily:fontFamily );

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14, color: ColorsApp.instance.onPrimaryContainer, fontFamily:fontFamily );
  TextStyle get buttonTextTitle => textExtraBold.copyWith(fontSize: 22);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}