import 'package:flutter/material.dart';

/// 📐 **OSMEA Sizer Extensions**
///
/// A collection of extension methods for responsive sizing and spacing
/// in OSMEA applications.
///
/// **Extension Categories:**
/// - 📱 Screen Dimensions
/// - 🔲 Padding & Margins
/// - ⭕ Border Radius
/// - ⏱️ Duration Helpers
/// - 📏 Size Constants
/// - 🎯 Alignment Utilities
///
/// **Example Usage:**
/// ```dart
/// Container(
///   padding: context.paddingNormal,
///   height: context.dynamicHeight(0.5),
/// )
/// ```
///
/// @category Utils
/// @subcategory Extensions

/// 📏 SIZER EXTENSION
extension SizerExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get allHeight => mediaQuery.size.height;
  double get allWidth => mediaQuery.size.width;
  TextScaler get textScaler => mediaQuery.textScaler;
  double get textScaleFactor => textScaler.scale(1.0);

  double get lowValue => allHeight * 0.01;
  double get normalValue => allHeight * 0.02;
  double get mediumValue => allHeight * 0.04;
  double get highValue => allHeight * 0.1;

  double get radiusNone => 0;
  double get radiusLow => 2;
  double get radiusNormal => 13;
  double get radiusMedium => 30;
  double get radiusHigh => 100;

  /// ↔️ Dynamically resize a width.
  double dynamicWidth(double value) => allWidth * value;

  /// ↕️ Dynamically resize a height.
  double dynamicHeight(double value) => allHeight * value;

  double get scaleLowValue => 1;
  double get scaleMediumValue => 1.5;
  double get scaleHighValue => 2;

  get nullValue => null;
  double get infinity => double.infinity;

  Divider get divider1 => const Divider(thickness: 1);
  Divider get divider2 => const Divider(thickness: 2);
  Divider get divider3 => const Divider(thickness: 2);
}

/// 🟦 BORDER EXTENSION
extension BorderRadiusExtension on BuildContext {
  BorderRadius get borderRadiusZero => BorderRadius.zero;
  BorderRadius get borderRadiusNone => BorderRadius.circular(radiusNone);
  BorderRadius get borderRadiusLow => BorderRadius.circular(radiusLow);
  BorderRadius get borderRadiusNormal => BorderRadius.circular(radiusNormal);
  BorderRadius get borderRadiusMedium => BorderRadius.circular(radiusMedium);
  BorderRadius get borderRadiusHigh => BorderRadius.circular(radiusHigh);
}

/// ⏱️ DURATION EXTENSION
/// Usage: 7.seconds or 7.minutes or 7.hours or 7.days or 7.weeks
extension DurationExtension on int {
  Duration get zero => Duration.zero;
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
  Duration get weeks => Duration(days: this * 7);
}

/// 📐 ALIGMENT EXTENSION
extension AlignmentExtension on dynamic {
  Alignment get topLeft => Alignment.topLeft;
  Alignment get topCenter => Alignment.topCenter;
  Alignment get topRight => Alignment.topRight;
  Alignment get centerLeft => Alignment.centerLeft;
  Alignment get center => Alignment.center;
  Alignment get centerRight => Alignment.centerRight;
  Alignment get bottomLeft => Alignment.bottomLeft;
  Alignment get bottomCenter => Alignment.bottomCenter;
  Alignment get bottomRight => Alignment.bottomRight;

  MainAxisAlignment get start => MainAxisAlignment.start;
  MainAxisAlignment get end => MainAxisAlignment.end;
  MainAxisAlignment get centerMain => MainAxisAlignment.center;
  MainAxisAlignment get spaceBetween => MainAxisAlignment.spaceBetween;
  MainAxisAlignment get spaceAround => MainAxisAlignment.spaceAround;
  MainAxisAlignment get spaceEvenly => MainAxisAlignment.spaceEvenly;

  CrossAxisAlignment get crossStart => CrossAxisAlignment.start;
  CrossAxisAlignment get crossEnd => CrossAxisAlignment.end;
  CrossAxisAlignment get crossCenter => CrossAxisAlignment.center;
  CrossAxisAlignment get crossStretch => CrossAxisAlignment.stretch;
  CrossAxisAlignment get crossBaseline => CrossAxisAlignment.baseline;

  WrapAlignment get wrapStart => WrapAlignment.start;
  WrapAlignment get wrapEnd => WrapAlignment.end;
  WrapAlignment get wrapCenter => WrapAlignment.center;
  WrapAlignment get wrapSpaceBetween => WrapAlignment.spaceBetween;
  WrapAlignment get wrapSpaceAround => WrapAlignment.spaceAround;
  WrapAlignment get wrapSpaceEvenly => WrapAlignment.spaceEvenly;

  MainAxisSize get min => MainAxisSize.min;
  MainAxisSize get max => MainAxisSize.max;

  TextDirection get ltr => TextDirection.ltr;
  TextDirection get rtl => TextDirection.rtl;

  Axis get horizontal => Axis.horizontal;
  Axis get vertical => Axis.vertical;
}

/// 🔠 TEXT SIZE EXTENSION
extension TextSizeX on BuildContext {
  double get fontSizeSmall => 12;
  double get fontSizeMedium => 16;
  double get fontSizeNormal => 20;
  double get fontSizeLarge => 24;
  double get fontSizeExtraLarge => 32;
}

/// ➖ EMPTY SIZED BOX EXTENSION
extension EmptyWidget on BuildContext {
  Widget get emptySizedBox => const SizedBox();
  Widget get emptySizedWidthBoxLow => SizedBox(width: lowValue);
  Widget get emptySizedWidthBoxNormal => SizedBox(width: normalValue);
  Widget get emptySizedWidthBoxHigh => SizedBox(width: highValue);
  Widget get emptySizedHeightBoxLow => SizedBox(height: lowValue);
  Widget get emptySizedHeightBoxNormal => SizedBox(height: normalValue);
  Widget get emptySizedHeightBoxMedium => SizedBox(height: mediumValue);
  Widget get emptySizedHeightBoxHigh => SizedBox(height: highValue);
  Widget get emptySized => const SizedBox();
  Widget get emptySizedWidthBoxZero => const SizedBox(width: 0);
  Widget get emptySizedHeightBoxZero => const SizedBox(height: 0);
}

/// 🟫 DIVIDER EXTENSION
extension DividerX on BuildContext {
  Widget divider({Color? color}) => Divider(
      indent: allWidth * 0.13,
      endIndent: allWidth * 0.13,
      color: color ?? Colors.grey,
      height: 2);
}

/// ↩️ TEXT DOWN LINE EXTENSION
extension TextEnterLine on BuildContext {
  String get enterLine => '\n';
}

/// 🖼️ IMAGE ASSET EXTENSION
extension ImageAssetX on BuildContext {
  Widget getImageFitWidth({String path = ''}) => Image.asset(
        path,
        height: allHeight * 0.1,
        fit: BoxFit.fitWidth,
      );
}

/// 🔳 ICON SIZE EXTENSION
extension IconSizeExtension on BuildContext {
  double get iconSizeZero => 0.0;
  double get iconSizeExtraSmall => 14.0;
  double get iconSizeSmall => 20.0;
  double get iconSizeNormal => 25.0;
  double get iconSizeMedium => 30.0;
  double get iconSizeLarge => 40.0;
  double get iconSizeHigh => 50.0;
  double get iconSizeExtraHigh => 60.0;
}

/// 🧩 PADDING EXTENSION
extension PaddingExtension on BuildContext {
  EdgeInsets get paddingZero => EdgeInsets.zero;
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get horizontalPaddingZero => EdgeInsets.zero;
  EdgeInsets get horizontalPaddingLow =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalPaddingNormal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalPaddingHigh =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalPaddingZero => EdgeInsets.zero;
  EdgeInsets get verticalPaddingLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalPaddingNormal =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalPaddingMedium =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalPaddingHigh =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get onlyLeftPaddingZero => EdgeInsets.zero;
  EdgeInsets get onlyLeftPaddingLow => EdgeInsets.only(left: lowValue);
  EdgeInsets get onlyLeftPaddingNormal => EdgeInsets.only(left: normalValue);
  EdgeInsets get onlyLeftPaddingMedium => EdgeInsets.only(left: mediumValue);
  EdgeInsets get onlyLeftPaddingHigh => EdgeInsets.only(left: highValue);

  EdgeInsets get onlyRightPaddingZero => EdgeInsets.zero;
  EdgeInsets get onlyRightPaddingLow => EdgeInsets.only(right: lowValue);
  EdgeInsets get onlyRightPaddingNormal => EdgeInsets.only(right: normalValue);
  EdgeInsets get onlyRightPaddingMedium => EdgeInsets.only(right: mediumValue);
  EdgeInsets get onlyRightPaddingHigh => EdgeInsets.only(right: highValue);

  EdgeInsets get onlyBottomPaddingZero => EdgeInsets.zero;
  EdgeInsets get onlyBottomPaddingLow => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get onlyBottomPaddingNormal =>
      EdgeInsets.only(bottom: normalValue);
  EdgeInsets get onlyBottomPaddingMedium =>
      EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get onlyBottomPaddingHigh => EdgeInsets.only(bottom: highValue);

  EdgeInsets get onlyTopPaddingZero => EdgeInsets.zero;
  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowValue);
  EdgeInsets get onlyTopPaddingNormal => EdgeInsets.only(top: normalValue);
  EdgeInsets get onlyTopPaddingMedium => EdgeInsets.only(top: mediumValue);
  EdgeInsets get onlyTopPaddingHigh => EdgeInsets.only(top: highValue);

  double get smallMobileHeight => 850;
  // 🆕 New custom fields can be add to this structure
}
