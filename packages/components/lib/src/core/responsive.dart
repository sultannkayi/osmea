import 'package:flutter/material.dart';
import '../theme/component_dimensions.dart';

/// Device type for responsive layout
enum DeviceType {
  mobile,
  tablet,
  desktop,
}

/// Breakpoints for responsive design
class OsmeaBreakpoints {
  static const double xs = 0; // Extra small devices (phones)
  static const double sm =
      600; // Small devices (portrait tablets and large phones)
  static const double md = 960; // Medium devices (landscape tablets)
  static const double lg = 1280; // Large devices (laptops/desktops)
  static const double xl = 1920; // Extra large devices (large desktops)
}

/// Helper for responsive design decisions
class OsmeaResponsive {
  // Determine current device type
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < ComponentDimensions.breakpointMobile) {
      return DeviceType.mobile;
    } else if (width < ComponentDimensions.breakpointTablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  // Execute different logic based on screen size
  static T responsive<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop;
    }
  }

  // Get responsive value based on screen width
  static double value({
    required BuildContext context,
    required double mobile,
    double? tablet,
    required double desktop,
  }) {
    return responsive<double>(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // Get responsive padding based on screen width
  static EdgeInsets padding({
    required BuildContext context,
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    required EdgeInsets desktop,
  }) {
    return responsive<EdgeInsets>(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // Adaptive widget builder that changes based on screen size
  static Widget builder({
    required BuildContext context,
    required Widget Function() mobile,
    Widget Function()? tablet,
    required Widget Function() desktop,
  }) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile();
      case DeviceType.tablet:
        return (tablet ?? mobile)();
      case DeviceType.desktop:
        return desktop();
    }
  }
}

// Extension on BuildContext for easier access to responsive utilities
extension OsmeaResponsiveExtension on BuildContext {
  // Check screen type
  bool get isMobile => OsmeaResponsive.getDeviceType(this) == DeviceType.mobile;
  bool get isTablet => OsmeaResponsive.getDeviceType(this) == DeviceType.tablet;
  bool get isDesktop =>
      OsmeaResponsive.getDeviceType(this) == DeviceType.desktop;

  // Get screen size
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Get responsive values
  double responsiveValue({
    required double mobile,
    double? tablet,
    required double desktop,
  }) {
    return OsmeaResponsive.value(
      context: this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // Get responsive padding
  EdgeInsets responsivePadding({
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    required EdgeInsets desktop,
  }) {
    return OsmeaResponsive.padding(
      context: this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // Get responsive space
  double space(double value) {
    return ComponentDimensions.responsiveSpacing(this, value);
  }

  // Get standard space tokens with responsive values
  double get spaceXXS =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceXXS);
  double get spaceXS =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceXS);
  double get spaceS =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceS);
  double get spaceM =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceM);
  double get spaceL =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceL);
  double get spaceXL =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceXL);
  double get spaceXXL =>
      ComponentDimensions.responsiveSpacing(this, ComponentDimensions.spaceXXL);
  // Using spaceXXL as a base for spaceXXXL since it wasn't defined in ComponentDimensions
  double get spaceXXXL => ComponentDimensions.responsiveSpacing(
      this, ComponentDimensions.spaceXXL * 1.5);
}
