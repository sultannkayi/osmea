import 'package:flutter/material.dart';

/// Design system dimensions and tokens for Osmea UI Kit
class ComponentDimensions {
  // space
  static const double spaceXXS = 4.0;
  static const double spaceXS = 8.0;
  static const double spaceS = 12.0;
  static const double spaceM = 16.0;
  static const double spaceL = 24.0;
  static const double spaceXL = 32.0;
  static const double spaceXXL = 48.0;

  // Border radius
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusCircular = 9999.0;

  // Border widths
  static const double borderThin = 1.0;
  static const double borderWidthThin = 1.0;
  static const double borderMedium = 2.0;
  static const double borderRegular = 2.0;
  static const double borderThick = 4.0;

  // Icon sizes
  static const double iconSizeXS = 12.0;
  static const double iconSizeS = 16.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;
  static const double iconSizeXL = 48.0;

  // Durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationMedium = Duration(milliseconds: 250);
  static const Duration durationSlow = Duration(milliseconds: 350);

  // Elevations (BoxShadow lists)
  static const List<BoxShadow> elevationXS = [
    BoxShadow(
      color: Color(0x0F000000), // 6% opacity
      blurRadius: 2.0,
      offset: Offset(0, 1.0),
    ),
  ];

  static const List<BoxShadow> elevationS = [
    BoxShadow(
      color: Color(0x14000000), // 8% opacity
      blurRadius: 3.0,
      offset: Offset(0, 2.0),
    ),
  ];

  static const List<BoxShadow> elevationM = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity
      blurRadius: 6.0,
      offset: Offset(0, 3.0),
    ),
  ];

  // Responsive breakpoints
  static const double breakpointMobile = 600.0;
  static const double breakpointTablet = 960.0;
  static const double breakpointDesktop = 1280.0;

  // Renamed from responsivespace to responsiveSpacing for consistency
  static double responsiveSpacing(BuildContext context, double baseSpacing) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Scale factor based on screen size
    if (screenWidth < breakpointMobile) {
      return baseSpacing; // Standard spacing on mobile
    } else if (screenWidth < breakpointTablet) {
      return baseSpacing * 1.1; // 10% larger on tablet
    } else {
      return baseSpacing * 1.2; // 20% larger on desktop
    }
  }
}
