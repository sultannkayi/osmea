import 'package:flutter/material.dart';

/// 🎯 TEXT DECORATION STYLE EXTENSION
extension TextDecorationStyleExtension on dynamic {
  TextDecorationStyle get solid => TextDecorationStyle.solid;
  TextDecorationStyle get double => TextDecorationStyle.double;
  TextDecorationStyle get dotted => TextDecorationStyle.dotted;
  TextDecorationStyle get dashed => TextDecorationStyle.dashed;
  TextDecorationStyle get wavy => TextDecorationStyle.wavy;
}

/// 📝 TEXT LEADING DISTRIBUTION EXTENSION
extension TextLeadingDistributionExtension on dynamic {
  TextLeadingDistribution get proportional =>
      TextLeadingDistribution.proportional;
  TextLeadingDistribution get even => TextLeadingDistribution.even;
}

/// 🎨 FONT FEATURE EXTENSION
extension FontFeatureExtension on BuildContext {
  List<FontFeature> get smallCaps => [const FontFeature.enable('smcp')];
  List<FontFeature> get oldstyleNums => [const FontFeature.enable('onum')];
  List<FontFeature> get liningNums => [const FontFeature.enable('lnum')];
  List<FontFeature> get tabularNums => [const FontFeature.enable('tnum')];
  List<FontFeature> get proportionalNums => [const FontFeature.enable('pnum')];
  List<FontFeature> get stylisticSet1 => [const FontFeature.enable('ss01')];
  List<FontFeature> get stylisticSet2 => [const FontFeature.enable('ss02')];
  List<FontFeature> get stylisticSet3 => [const FontFeature.enable('ss03')];
}

/// 🎭 FONT VARIATION EXTENSION
extension FontVariationExtension on BuildContext {
  List<FontVariation> get fontVariationNormal => [];
  List<FontVariation> get fontVariationWide =>
      [const FontVariation('wdth', 125.0)];
  List<FontVariation> get fontVariationCondensed =>
      [const FontVariation('wdth', 75.0)];
  List<FontVariation> get fontVariationSlant =>
      [const FontVariation('slnt', -15.0)];
}

/// 📏 LETTER SPACING EXTENSION
extension LetterSpacingExtension on BuildContext {
  double get letterSpacingTight => -0.5;
  double get letterSpacingNormal => 0.0;
  double get letterSpacingWide => 0.5;
  double get letterSpacingExtraWide => 1.0;
  double get letterSpacingExtraTight => -1.0;
  double get letterSpacingLoose => 1.5;
  double get letterSpacingExtraLoose => 2.0;
}

/// 📐 WORD SPACING EXTENSION
extension WordSpacingExtension on BuildContext {
  double get wordSpacingTight => -1.0;
  double get wordSpacingNormal => 0.0;
  double get wordSpacingWide => 1.0;
  double get wordSpacingExtraWide => 2.0;
  double get wordSpacingLoose => 3.0;
}

/// 🔤 FONT FAMILY EXTENSION
extension FontFamilyExtension on BuildContext {
  String get fontDefault => '';
  String get fontRoboto => 'Roboto';
  String get fontOpenSans => 'Open Sans';
  String get fontLato => 'Lato';
  String get fontMontserrat => 'Montserrat';
  String get fontPoppins => 'Poppins';
  String get fontNunito => 'Nunito';
  String get fontRaleway => 'Raleway';
  String get fontSourceSansPro => 'Source Sans Pro';
  String get fontOswald => 'Oswald';
  String get fontPlayfairDisplay => 'Playfair Display';
  String get fontMerriweather => 'Merriweather';
  String get fontPTSans => 'PT Sans';
  String get fontWorkSans => 'Work Sans';
  String get fontInter => 'Inter';
  String get fontDMSans => 'DM Sans';
  String get fontRubik => 'Rubik';
  String get fontManrope => 'Manrope';
  String get fontFiraCode => 'Fira Code';
  String get fontJetBrainsMono => 'JetBrains Mono';
  String get fontCourierNew => 'Courier New';
  String get fontTimesNewRoman => 'Times New Roman';
  String get fontArial => 'Arial';
  String get fontHelvetica => 'Helvetica';
  String get fontSFProDisplay => 'SF Pro Display';
  String get fontSFProText => 'SF Pro Text';
}

/// 📝 TEXT CAPITALIZATION EXTENSION
extension TextCapitalizationExtension on dynamic {
  TextCapitalization get words => TextCapitalization.words;
  TextCapitalization get sentences => TextCapitalization.sentences;
  TextCapitalization get characters => TextCapitalization.characters;
  TextCapitalization get noneCapitalization => TextCapitalization.none;
}

/// 🎯 TEXT BASELINE EXTENSION
extension TextBaselineExtension on dynamic {
  TextBaseline get alphabetic => TextBaseline.alphabetic;
  TextBaseline get ideographic => TextBaseline.ideographic;
}

/// 📝 TEXT DECORATION EXTENSION
extension TextDecorationExtension on dynamic {
  TextDecoration get none => TextDecoration.none;
  TextDecoration get underline => TextDecoration.underline;
  TextDecoration get overline => TextDecoration.overline;
  TextDecoration get lineThrough => TextDecoration.lineThrough;
}

/// 🔤 TEXT OVERFLOW EXTENSION
extension TextOverflowExtension on dynamic {
  TextOverflow get clip => TextOverflow.clip;
  TextOverflow get fade => TextOverflow.fade;
  TextOverflow get ellipsis => TextOverflow.ellipsis;
  TextOverflow get visible => TextOverflow.visible;
}

/// 🔠 TEXT ALIGN EXTENSION
extension TextAlignExtension on dynamic {
  TextAlign get textLeft => TextAlign.left;
  TextAlign get textRight => TextAlign.right;
  TextAlign get textCenter => TextAlign.center;
  TextAlign get textJustify => TextAlign.justify;
  TextAlign get textStart => TextAlign.start;
  TextAlign get textEnd => TextAlign.end;
}

/// ✍️ FONT WEIGHT EXTENSION
extension FontWeightExtension on BuildContext {
  FontWeight get thin => FontWeight.w100;
  FontWeight get extraLight => FontWeight.w200;
  FontWeight get light => FontWeight.w300;
  FontWeight get normal => FontWeight.w400;
  FontWeight get medium => FontWeight.w500;
  FontWeight get semiBold => FontWeight.w600;
  FontWeight get bold => FontWeight.w700;
  FontWeight get extraBold => FontWeight.w800;
  FontWeight get black => FontWeight.w900;
}

/// 🔠 TEXT SIZE EXTENSION
extension TextSizeX on BuildContext {
  double get fontSizeTiny => 8;
  double get fontSizeExtraSmall => 10;
  double get fontSizeSmall => 12;
  double get fontSizeExtraSmallMedium => 14;
  double get fontSizeMedium => 16;
  double get fontSizeNormal => 20;
  double get fontSizeLarge => 24;
  double get fontSizeExtraLarge => 32;
}

/// 🎨 FONT STYLE EXTENSION
extension FontStyleExtension on dynamic {
  FontStyle get italic => FontStyle.italic;
  FontStyle get normalStyle => FontStyle.normal;
}

/// 🔄 TEXT MAX LINE EXTENSION
/// Controls the maximum number of lines for text display
extension TextMaxLineExtension on BuildContext {
  int get maxLineOne => 1;
  int get maxLineTwo => 2;
  int get maxLineThree => 3;
  int get maxLineFour => 4;
  int get maxLineFive => 5;
  int get maxLineSix => 6;
  int get maxLineEight => 8;
  int get maxLineTen => 10;
  int get maxLineTwelve => 12;
  int get maxLineFifteen => 15;
  int get maxLineTwenty => 20;
  int get maxLineUnlimited => 999;
}

/// ↩️ TEXT DOWN LINE EXTENSION
extension TextEnterLine on BuildContext {
  String get enterLine => '\n';
}
