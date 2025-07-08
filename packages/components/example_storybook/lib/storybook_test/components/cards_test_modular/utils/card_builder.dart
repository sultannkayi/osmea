import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🃏 **Card Builder Utility**
/// 
/// Helper utility methods for building OSMEA card widgets within the showcase.
class CardBuilder {
  /// Convert enum to a human-readable string.
  static String enumToString(dynamic value) => value.toString().split('.').last;

  /// Build a basic card with common parameters.
  static Widget buildBasicCard({
    required String title,
    required String subtitle,
    required String content,
    required ComponentAppearance variant,
    required ComponentSize size,
    VoidCallback? onTap,
  }) {
    return OsmeaComponents.basicCard(
      title: title,
      subtitle: subtitle,
      content: content,
      variant: variant,
      size: size,
      onTap: onTap,
    );
  }
} 