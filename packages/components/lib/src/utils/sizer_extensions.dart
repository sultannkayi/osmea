import 'package:flutter/material.dart';

/// 🎯 **OSMEA Sizer Extensions**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Extensions for Sizer utilities in the OSMEA UI Kit.
/// Provides a comprehensive set of utilities for:
///
/// {@category Utils}
/// {@subCategory SizerExtensions}
///
/// Extensions:
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
  BorderRadius get borderRadiusMinStandard => BorderRadius.circular(7);
  BorderRadius get borderRadiusMaxStandard => BorderRadius.circular(13);
}

/// 🔲 BORDER WIDTH EXTENSION
extension BorderWidthExtension on BuildContext {
  // Standard border widths
  double get borderWidth => 0.5;
}

/// ⏱️ DURATION EXTENSION
/// Usage: 7.seconds or 7.minutes or 7.hours or 7.days or 7.weeks
extension DurationExtension on int {
  Duration get zero => Duration.zero;
  Duration get microseconds => Duration(microseconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
  Duration get weeks => Duration(days: this * 7);
}

/// ⏰ DURATION VALUES EXTENSION
extension DurationValuesExtension on BuildContext {
  Duration get durationZero => Duration.zero;
  Duration get durationInstant => const Duration(milliseconds: 1);
  Duration get durationFast => const Duration(milliseconds: 100);
  Duration get durationQuick => const Duration(milliseconds: 200);
  Duration get durationNormal => const Duration(milliseconds: 300);
  Duration get durationMedium => const Duration(milliseconds: 500);
  Duration get durationSlow => const Duration(milliseconds: 800);
  Duration get durationVerySlow => const Duration(seconds: 1);
  Duration get durationLong => const Duration(seconds: 2);
  Duration get durationVeryLong => const Duration(seconds: 3);

  // Animation durations
  Duration get animationShort => const Duration(milliseconds: 150);
  Duration get animationMedium => const Duration(milliseconds: 300);
  Duration get animationLong => const Duration(milliseconds: 500);
  Duration get animationSlow => const Duration(milliseconds: 800);

  // Delay durations
  Duration get delayShort => const Duration(milliseconds: 100);
  Duration get delayMedium => const Duration(milliseconds: 300);
  Duration get delayLong => const Duration(milliseconds: 500);

  // Timeout durations
  Duration get timeoutQuick => const Duration(seconds: 5);
  Duration get timeoutNormal => const Duration(seconds: 10);
  Duration get timeoutLong => const Duration(seconds: 30);
  Duration get timeoutVeryLong => const Duration(minutes: 1);
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

/// 📦 BOX FIT EXTENSION
extension BoxFitExtension on dynamic {
  BoxFit get fill => BoxFit.fill;
  BoxFit get contain => BoxFit.contain;
  BoxFit get cover => BoxFit.cover;
  BoxFit get fitWidth => BoxFit.fitWidth;
  BoxFit get fitHeight => BoxFit.fitHeight;
  BoxFit get scaleDown => BoxFit.scaleDown;
}

/// 📐 STACK FIT EXTENSION
extension StackFitExtension on dynamic {
  StackFit get loose => StackFit.loose;
  StackFit get expand => StackFit.expand;
  StackFit get passthrough => StackFit.passthrough;
}

/// 📏 SPACING EXTENSION
extension SpacingExtension on BuildContext {
  double get spacingZero => 0;
  double get spacingLow => lowValue;
  double get spacingNormal => normalValue;
  double get spacingMedium => mediumValue;
  double get spacingHigh => highValue;

  double get spacing2 => 2;
  double get spacing4 => 4;
  double get spacing6 => 6;
  double get spacing8 => 8;
  double get spacing10 => 10;
  double get spacing12 => 12;
  double get spacing16 => 16;
  double get spacing20 => 20;
  double get spacing24 => 24;
  double get spacing32 => 32;
  double get spacing40 => 40;
  double get spacing48 => 48;
  double get spacing56 => 56;
  double get spacing64 => 64;
}

/// 📐 WIDTH EXTENSION
extension WidthExtension on BuildContext {
  double get widthZero => 0;
  double get widthLow => lowValue;
  double get widthNormal => normalValue;
  double get widthMedium => mediumValue;
  double get widthHigh => highValue;

  double get width1 => 1;
  double get width2 => 2;
  double get width4 => 4;
  double get width8 => 8;
  double get width12 => 12;
  double get width16 => 16;
  double get width20 => 20;
  double get width24 => 24;
  double get width32 => 32;
  double get width40 => 40;
  double get width48 => 48;
  double get width56 => 56;
  double get width64 => 64;
  double get width80 => 80;
  double get width96 => 96;
  double get width112 => 112;
  double get width128 => 128;
  double get width144 => 144;
  double get width160 => 160;
  double get width176 => 176;
  double get width192 => 192;
  double get width208 => 208;
  double get width224 => 224;
  double get width240 => 240;
  double get width256 => 256;
  double get width288 => 288;
  double get width320 => 320;
  double get width384 => 384;
}

/// 📏 HEIGHT EXTENSION
extension HeightExtension on BuildContext {
  double get heightZero => 0;
  double get heightLow => lowValue;
  double get heightNormal => normalValue;
  double get heightMedium => mediumValue;
  double get heightHigh => highValue;

  double get height1 => 1;
  double get height2 => 2;
  double get height4 => 4;
  double get height8 => 8;
  double get height12 => 12;
  double get height16 => 16;
  double get height20 => 20;
  double get height24 => 24;
  double get height32 => 32;
  double get height40 => 40;
  double get height48 => 48;
  double get height56 => 56;
  double get height64 => 64;
  double get height80 => 80;
  double get height96 => 96;
  double get height112 => 112;
  double get height128 => 128;
  double get height144 => 144;
  double get height160 => 160;
  double get height176 => 176;
  double get height192 => 192;
  double get height208 => 208;
  double get height224 => 224;
  double get height240 => 240;
  double get height256 => 256;
  double get height288 => 288;
  double get height320 => 320;
  double get height384 => 384;
  double get height448 => 448;
  double get height512 => 512;
  double get height576 => 576;
  double get height640 => 640;
}

/// 🔄 WRAP CROSS ALIGNMENT EXTENSION
extension WrapCrossAlignmentExtension on dynamic {
  WrapCrossAlignment get wrapCrossStart => WrapCrossAlignment.start;
  WrapCrossAlignment get wrapCrossEnd => WrapCrossAlignment.end;
  WrapCrossAlignment get wrapCrossCenter => WrapCrossAlignment.center;
}

/// 🎪 ANIMATION STATUS EXTENSION
extension AnimationStatusExtension on dynamic {
  AnimationStatus get dismissed => AnimationStatus.dismissed;
  AnimationStatus get forward => AnimationStatus.forward;
  AnimationStatus get reverse => AnimationStatus.reverse;
  AnimationStatus get completed => AnimationStatus.completed;
}

/// 🔧 CLIP BEHAVIOR EXTENSION

extension ClipBehaviorExtension on dynamic {
  Clip get clipNone => Clip.none;
  Clip get clipHardEdge => Clip.hardEdge;
  Clip get clipAntiAlias => Clip.antiAlias;
  Clip get clipAntiAliasWithSaveLayer => Clip.antiAliasWithSaveLayer;
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
  double get iconSizeNormal => 24.0;
  double get iconSizeMedium => 28.0;
  double get iconSizeLarge => 32.0;
  double get iconSizeHigh => 36.0;
  double get iconSizeExtraHigh => 40.0;
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

/// 📈 CURVES EXTENSION
extension CurvesExtension on dynamic {
  Curve get linear => Curves.linear;
  Curve get decelerate => Curves.decelerate;
  Curve get fastLinearToSlowEaseIn => Curves.fastLinearToSlowEaseIn;
  Curve get ease => Curves.ease;
  Curve get easeIn => Curves.easeIn;
  Curve get easeInToLinear => Curves.easeInToLinear;
  Curve get easeInSine => Curves.easeInSine;
  Curve get easeInQuad => Curves.easeInQuad;
  Curve get easeInCubic => Curves.easeInCubic;
  Curve get easeInQuart => Curves.easeInQuart;
  Curve get easeInQuint => Curves.easeInQuint;
  Curve get easeInExpo => Curves.easeInExpo;
  Curve get easeInCirc => Curves.easeInCirc;
  Curve get easeInBack => Curves.easeInBack;
  Curve get easeOut => Curves.easeOut;
  Curve get linearToEaseOut => Curves.linearToEaseOut;
  Curve get easeOutSine => Curves.easeOutSine;
  Curve get easeOutQuad => Curves.easeOutQuad;
  Curve get easeOutCubic => Curves.easeOutCubic;
  Curve get easeOutQuart => Curves.easeOutQuart;
  Curve get easeOutQuint => Curves.easeOutQuint;
  Curve get easeOutExpo => Curves.easeOutExpo;
  Curve get easeOutCirc => Curves.easeOutCirc;
  Curve get easeOutBack => Curves.easeOutBack;
  Curve get easeInOut => Curves.easeInOut;
  Curve get easeInOutSine => Curves.easeInOutSine;
  Curve get easeInOutQuad => Curves.easeInOutQuad;
  Curve get easeInOutCubic => Curves.easeInOutCubic;
  Curve get easeInOutQuart => Curves.easeInOutQuart;
  Curve get easeInOutQuint => Curves.easeInOutQuint;
  Curve get easeInOutExpo => Curves.easeInOutExpo;
  Curve get easeInOutCirc => Curves.easeInOutCirc;
  Curve get easeInOutBack => Curves.easeInOutBack;
  Curve get fastOutSlowIn => Curves.fastOutSlowIn;
  Curve get slowMiddle => Curves.slowMiddle;
  Curve get bounceIn => Curves.bounceIn;
  Curve get bounceOut => Curves.bounceOut;
  Curve get bounceInOut => Curves.bounceInOut;
  Curve get elasticIn => Curves.elasticIn;
  Curve get elasticOut => Curves.elasticOut;
  Curve get elasticInOut => Curves.elasticInOut;
}

/// 🎨 BLEND MODE EXTENSION
extension BlendModeExtension on dynamic {
  BlendMode get clear => BlendMode.clear;
  BlendMode get src => BlendMode.src;
  BlendMode get dst => BlendMode.dst;
  BlendMode get srcOver => BlendMode.srcOver;
  BlendMode get dstOver => BlendMode.dstOver;
  BlendMode get srcIn => BlendMode.srcIn;
  BlendMode get dstIn => BlendMode.dstIn;
  BlendMode get srcOut => BlendMode.srcOut;
  BlendMode get dstOut => BlendMode.dstOut;
  BlendMode get srcATop => BlendMode.srcATop;
  BlendMode get dstATop => BlendMode.dstATop;
  BlendMode get xor => BlendMode.xor;
  BlendMode get plus => BlendMode.plus;
  BlendMode get modulate => BlendMode.modulate;
  BlendMode get screen => BlendMode.screen;
  BlendMode get overlay => BlendMode.overlay;
  BlendMode get darken => BlendMode.darken;
  BlendMode get lighten => BlendMode.lighten;
  BlendMode get colorDodge => BlendMode.colorDodge;
  BlendMode get colorBurn => BlendMode.colorBurn;
  BlendMode get hardLight => BlendMode.hardLight;
  BlendMode get softLight => BlendMode.softLight;
  BlendMode get difference => BlendMode.difference;
  BlendMode get exclusion => BlendMode.exclusion;
  BlendMode get multiply => BlendMode.multiply;
  BlendMode get hue => BlendMode.hue;
  BlendMode get saturation => BlendMode.saturation;
  BlendMode get color => BlendMode.color;
  BlendMode get luminosity => BlendMode.luminosity;
}

/// 🎪 FLEX EXTENSION
extension FlexExtension on BuildContext {
  int get flex0 => 0;
  int get flex1 => 1;
  int get flex2 => 2;
  int get flex3 => 3;
  int get flex4 => 4;
  int get flex5 => 5;
  int get flex6 => 6;
  int get flex7 => 7;
  int get flex8 => 8;
  int get flex9 => 9;
  int get flex10 => 10;
}

/// 📊 OPACITY EXTENSION
extension OpacityExtension on BuildContext {
  double get opacity0 => 0.0;
  double get opacity10 => 0.1;
  double get opacity20 => 0.2;
  double get opacity30 => 0.3;
  double get opacity40 => 0.4;
  double get opacity50 => 0.5;
  double get opacity60 => 0.6;
  double get opacity70 => 0.7;
  double get opacity80 => 0.8;
  double get opacity90 => 0.9;
  double get opacity100 => 1.0;
}

/// 🎨 ALPHA EXTENSION
extension AlphaExtension on BuildContext {
  double get alpha0 => 0.0;
  double get alpha5 => 0.05;
  double get alpha10 => 0.1;
  double get alpha15 => 0.15;
  double get alpha20 => 0.2;
  double get alpha25 => 0.25;
  double get alpha30 => 0.3;
  double get alpha35 => 0.35;
  double get alpha40 => 0.4;
  double get alpha45 => 0.45;
  double get alpha50 => 0.5;
  double get alpha55 => 0.55;
  double get alpha60 => 0.6;
  double get alpha65 => 0.65;
  double get alpha70 => 0.7;
  double get alpha75 => 0.75;
  double get alpha80 => 0.8;
  double get alpha85 => 0.85;
  double get alpha90 => 0.9;
  double get alpha95 => 0.95;
  double get alpha100 => 1.0;

  // Named alpha values for common use cases
  double get alphaTransparent => 0.0;
  double get alphaSubtle => 0.05;
  double get alphaLight => 0.1;
  double get alphaMedium => 0.3;
  double get alphaStrong => 0.7;
  double get alphaOpaque => 1.0;

  // Common overlay alpha values
  double get alphaOverlayLight => 0.2;
  double get alphaOverlayMedium => 0.5;
  double get alphaOverlayDark => 0.8;

  // Disabled state alpha
  double get alphaDisabled => 0.38;
  double get alphaHint => 0.6;
}

/// 📍 OFFSET EXTENSION
extension OffsetExtension on BuildContext {
  // Zero offset
  Offset get offsetZero => Offset.zero;

  // Common offset values
  Offset get offset1 => const Offset(1, 1);
  Offset get offset2 => const Offset(2, 2);
  Offset get offset4 => const Offset(4, 4);
  Offset get offset8 => const Offset(8, 8);
  Offset get offset12 => const Offset(12, 12);
  Offset get offset16 => const Offset(16, 16);
  Offset get offset20 => const Offset(20, 20);
  Offset get offset24 => const Offset(24, 24);
  Offset get offset32 => const Offset(32, 32);

  // Horizontal offsets
  Offset get offsetHorizontal1 => const Offset(1, 0);
  Offset get offsetHorizontal2 => const Offset(2, 0);
  Offset get offsetHorizontal4 => const Offset(4, 0);
  Offset get offsetHorizontal8 => const Offset(8, 0);
  Offset get offsetHorizontal12 => const Offset(12, 0);
  Offset get offsetHorizontal16 => const Offset(16, 0);
  Offset get offsetHorizontal20 => const Offset(20, 0);
  Offset get offsetHorizontal24 => const Offset(24, 0);

  // Vertical offsets
  Offset get offsetVertical1 => const Offset(0, 1);
  Offset get offsetVertical2 => const Offset(0, 2);
  Offset get offsetVertical4 => const Offset(0, 4);
  Offset get offsetVertical8 => const Offset(0, 8);
  Offset get offsetVertical12 => const Offset(0, 12);
  Offset get offsetVertical16 => const Offset(0, 16);
  Offset get offsetVertical20 => const Offset(0, 20);
  Offset get offsetVertical24 => const Offset(0, 24);

  // Shadow offsets (commonly used for elevation effects)
  Offset get shadowOffsetLow => const Offset(0, 1);
  Offset get shadowOffsetNormal => const Offset(0, 2);
  Offset get shadowOffsetMedium => const Offset(0, 4);
  Offset get shadowOffsetHigh => const Offset(0, 8);
  Offset get shadowOffsetExtraHigh => const Offset(0, 16);

  // Negative offsets for special effects
  Offset get offsetNegative1 => const Offset(-1, -1);
  Offset get offsetNegative2 => const Offset(-2, -2);
  Offset get offsetNegative4 => const Offset(-4, -4);
  Offset get offsetNegative8 => const Offset(-8, -8);

  // Custom offset builders
  Offset offsetCustom(double dx, double dy) => Offset(dx, dy);
  Offset offsetHorizontalCustom(double dx) => Offset(dx, 0);
  Offset offsetVerticalCustom(double dy) => Offset(0, dy);
}

/// ⚙️ MATERIAL STATE EXTENSION
extension WidgetStateExtension on dynamic {
  WidgetState get pressed => WidgetState.pressed;
  WidgetState get hovered => WidgetState.hovered;
  WidgetState get focused => WidgetState.focused;
  WidgetState get selected => WidgetState.selected;
  WidgetState get disabled => WidgetState.disabled;
  WidgetState get dragged => WidgetState.dragged;
  WidgetState get error => WidgetState.error;
}

/// 🎭 FLOATING ACTION BUTTON LOCATION EXTENSION
extension FloatingActionButtonLocationExtension on dynamic {
  FloatingActionButtonLocation get centerDocked =>
      FloatingActionButtonLocation.centerDocked;
  FloatingActionButtonLocation get centerFloat =>
      FloatingActionButtonLocation.centerFloat;
  FloatingActionButtonLocation get centerTop =>
      FloatingActionButtonLocation.centerTop;
  FloatingActionButtonLocation get endDocked =>
      FloatingActionButtonLocation.endDocked;
  FloatingActionButtonLocation get endFloat =>
      FloatingActionButtonLocation.endFloat;
  FloatingActionButtonLocation get endTop =>
      FloatingActionButtonLocation.endTop;
  FloatingActionButtonLocation get miniCenterDocked =>
      FloatingActionButtonLocation.miniCenterDocked;
  FloatingActionButtonLocation get miniCenterFloat =>
      FloatingActionButtonLocation.miniCenterFloat;
  FloatingActionButtonLocation get miniCenterTop =>
      FloatingActionButtonLocation.miniCenterTop;
  FloatingActionButtonLocation get miniEndDocked =>
      FloatingActionButtonLocation.miniEndDocked;
  FloatingActionButtonLocation get miniEndFloat =>
      FloatingActionButtonLocation.miniEndFloat;
  FloatingActionButtonLocation get miniEndTop =>
      FloatingActionButtonLocation.miniEndTop;
  FloatingActionButtonLocation get miniStartDocked =>
      FloatingActionButtonLocation.miniStartDocked;
  FloatingActionButtonLocation get miniStartFloat =>
      FloatingActionButtonLocation.miniStartFloat;
  FloatingActionButtonLocation get miniStartTop =>
      FloatingActionButtonLocation.miniStartTop;
  FloatingActionButtonLocation get startDocked =>
      FloatingActionButtonLocation.startDocked;
  FloatingActionButtonLocation get startFloat =>
      FloatingActionButtonLocation.startFloat;
  FloatingActionButtonLocation get startTop =>
      FloatingActionButtonLocation.startTop;
}

/// 🎚️ SLIDER THEME EXTENSION
extension SliderThemeExtension on dynamic {
  ShowValueIndicator get onlyForDiscrete => ShowValueIndicator.onlyForDiscrete;
  ShowValueIndicator get onlyForContinuous =>
      ShowValueIndicator.onlyForContinuous;
  ShowValueIndicator get always => ShowValueIndicator.always;
  ShowValueIndicator get neverShow => ShowValueIndicator.never;
}

/// 🎯 HIT TEST BEHAVIOR EXTENSION
extension HitTestBehaviorExtension on dynamic {
  HitTestBehavior get deferToChild => HitTestBehavior.deferToChild;
  HitTestBehavior get opaque => HitTestBehavior.opaque;
  HitTestBehavior get translucent => HitTestBehavior.translucent;
}

/// 📏 MARGIN EXTENSION
extension MarginExtension on BuildContext {
  EdgeInsets get marginZero => EdgeInsets.zero;
  EdgeInsets get marginLow => EdgeInsets.all(lowValue);
  EdgeInsets get marginNormal => EdgeInsets.all(normalValue);
  EdgeInsets get marginMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get marginHigh => EdgeInsets.all(highValue);

  EdgeInsets get horizontalMarginLow =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalMarginNormal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalMarginMedium =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalMarginHigh =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalMarginLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalMarginNormal =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalMarginMedium =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalMarginHigh =>
      EdgeInsets.symmetric(vertical: highValue);
}

/// 📱 MEDIA QUERY EXTENSION
extension MediaQueryExtension on BuildContext {
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  bool get accessibleNavigation => MediaQuery.of(this).accessibleNavigation;
  bool get invertColors => MediaQuery.of(this).invertColors;
  bool get disableAnimations => MediaQuery.of(this).disableAnimations;
  bool get boldText => MediaQuery.of(this).boldText;
  double get textScaleFactorClamped => MediaQuery.of(this)
      .textScaler
      .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2)
      .scale(1.0);
}

/// 📏 LINE HEIGHT EXTENSION
extension LineHeightExtension on BuildContext {
  double get lineHeightTight => 1.0;
  double get lineHeightSnug => 1.2;
  double get lineHeightNormal => 1.4;
  double get lineHeightRelaxed => 1.6;
  double get lineHeightLoose => 1.8;
  double get lineHeightExtraLoose => 2.0;
}

/// 🌫️ BLUR RADIUS EXTENSION
extension BlurRadiusExtension on BuildContext {
  // No blur
  double get blurRadiusZero => 0.0;

  // Light blur effects
  double get blurRadiusLight => 1.0;
  double get blurRadiusSubtle => 2.0;
  double get blurRadiusNormal => 4.0;
  double get blurRadiusMedium => 6.0;
  double get blurRadiusStrong => 8.0;

  // Heavy blur effects
  double get blurRadiusHeavy => 12.0;
  double get blurRadiusExtraHeavy => 16.0;
  double get blurRadiusExtreme => 24.0;
  double get blurRadiusMax => 32.0;

  // Specific blur values
  double get blurRadius1 => 1.0;
  double get blurRadius2 => 2.0;
  double get blurRadius3 => 3.0;
  double get blurRadius4 => 4.0;
  double get blurRadius5 => 5.0;
  double get blurRadius6 => 6.0;
  double get blurRadius8 => 8.0;
  double get blurRadius10 => 10.0;
  double get blurRadius12 => 12.0;
  double get blurRadius16 => 16.0;
  double get blurRadius20 => 20.0;
  double get blurRadius24 => 24.0;
  double get blurRadius28 => 28.0;
  double get blurRadius32 => 32.0;
  double get blurRadius40 => 40.0;
  double get blurRadius48 => 48.0;
  double get blurRadius64 => 64.0;

  // Shadow specific blur radii
  double get shadowBlurLow => 2.0;
  double get shadowBlurNormal => 4.0;
  double get shadowBlurMedium => 8.0;
  double get shadowBlurHigh => 12.0;
  double get shadowBlurExtraHigh => 20.0;
}

/// 📊 SPREAD RADIUS EXTENSION
extension SpreadRadiusExtension on BuildContext {
  // No spread
  double get spreadRadiusZero => 0.0;

  // Positive spread (shadow grows)
  double get spreadRadiusSmall => 1.0;
  double get spreadRadiusNormal => 2.0;
  double get spreadRadiusMedium => 4.0;
  double get spreadRadiusLarge => 6.0;
  double get spreadRadiusExtraLarge => 8.0;

  // Negative spread (shadow shrinks)
  double get spreadRadiusNegativeSmall => -1.0;
  double get spreadRadiusNegativeNormal => -2.0;
  double get spreadRadiusNegativeMedium => -4.0;
  double get spreadRadiusNegativeLarge => -6.0;

  // Specific spread values
  double get spreadRadius1 => 1.0;
  double get spreadRadius2 => 2.0;
  double get spreadRadius3 => 3.0;
  double get spreadRadius4 => 4.0;
  double get spreadRadius5 => 5.0;
  double get spreadRadius6 => 6.0;
  double get spreadRadius8 => 8.0;
  double get spreadRadius10 => 10.0;
  double get spreadRadius12 => 12.0;
  double get spreadRadius16 => 16.0;

  // Shadow specific spread radii
  double get shadowSpreadLow => 0.0;
  double get shadowSpreadNormal => 1.0;
  double get shadowSpreadMedium => 2.0;
  double get shadowSpreadHigh => 4.0;
  double get shadowSpreadExtraHigh => 6.0;

  // Inset shadow spreads (negative values)
  double get insetSpreadSmall => -1.0;
  double get insetSpreadMedium => -2.0;
  double get insetSpreadLarge => -4.0;
}

/// 📦 BOX SHAPE EXTENSION
extension BoxShapeExtension on dynamic {
  // Basic shapes
  BoxShape get rectangleShape => BoxShape.rectangle;
  BoxShape get circleShape => BoxShape.circle;

  // Named shape accessors for clarity
  BoxShape get shapeRectangle => BoxShape.rectangle;
  BoxShape get shapeCircle => BoxShape.circle;
  BoxShape get shapeRound => BoxShape.circle;
  BoxShape get shapeSquare => BoxShape.rectangle; // When width == height

  // Context-aware shape names
  BoxShape get containerShapeRectangle => BoxShape.rectangle;
  BoxShape get containerShapeCircle => BoxShape.circle;
  BoxShape get avatarShape => BoxShape.circle;
  BoxShape get buttonShapeRectangle => BoxShape.rectangle;
  BoxShape get buttonShapeCircle => BoxShape.circle;
  BoxShape get iconShape => BoxShape.circle;
  BoxShape get cardShape => BoxShape.rectangle;
  BoxShape get badgeShape => BoxShape.circle;
  BoxShape get chipShape => BoxShape.rectangle;
}
