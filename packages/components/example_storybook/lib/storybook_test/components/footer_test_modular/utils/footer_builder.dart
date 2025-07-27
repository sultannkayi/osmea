import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔨 **Footer Builder Helper**
/// 
/// Helper class for building Footer components with different configurations
/// Used to centralize Footer building logic across showcases
class FooterBuilder {
  /// Build footer items based on variant and custom items
  static List<OsmeaFooterItem> buildFooterItems({
    required FooterVariant variant,
    List<OsmeaFooterItem>? customItems,
  }) {
    if (variant == FooterVariant.custom && customItems != null) {
      return customItems.take(3).toList();
    }
    
    return _getDefaultItemsForVariant(variant);
  }

  /// Get default items for a specific variant
  static List<OsmeaFooterItem> _getDefaultItemsForVariant(FooterVariant variant) {
    switch (variant) {
      case FooterVariant.defaultFooter:
        return [
          OsmeaFooterItem(
            label: 'About',
            description: 'Learn more about our company, mission, and values.',
          ),
          OsmeaFooterItem(
            label: 'Legal',
            description: 'Terms of service, privacy policy, and legal information.',
          ),
          OsmeaFooterItem(
            label: 'Contact',
            description: 'Get in touch with our support team.',
          ),
        ];
      case FooterVariant.legal:
        return [
          OsmeaFooterItem(
            label: 'Terms',
            description: 'Terms of service and user agreement.',
          ),
          OsmeaFooterItem(
            label: 'Privacy',
            description: 'Privacy policy and data handling practices.',
          ),
          OsmeaFooterItem(
            label: 'Cookies',
            description: 'Cookie policy and preferences.',
          ),
        ];
      case FooterVariant.social:
        return [
          OsmeaFooterItem(
            label: 'Twitter',
            description: 'Follow us on Twitter for updates.',
            icon: Icons.alternate_email,
          ),
          OsmeaFooterItem(
            label: 'LinkedIn',
            description: 'Connect with us on LinkedIn.',
            icon: Icons.business,
          ),
          OsmeaFooterItem(
            label: 'GitHub',
            description: 'View our open source projects.',
            icon: Icons.code,
          ),
        ];
      case FooterVariant.minimal:
        return [
          OsmeaFooterItem(
            label: 'Help',
            description: 'Get help and support.',
          ),
          OsmeaFooterItem(
            label: 'About',
            description: 'About our company.',
          ),
        ];
      case FooterVariant.custom:
      case FooterVariant.textOnly:
        return [];
    }
  }

  /// Build footer configuration summary
  static Map<String, String> buildConfigSummary({
    required FooterVariant variant,
    required double dividerThickness,
    required double dividerIndent,
    required double dividerEndIndent,
    Color? backgroundColor,
    String? customText,
    int? itemCount,
  }) {
    return {
      'Variant': _getVariantName(variant),
      'Divider': '${dividerThickness.toStringAsFixed(1)}px thick',
      'Indent': '${dividerIndent.toStringAsFixed(0)}px / ${dividerEndIndent.toStringAsFixed(0)}px',
      if (backgroundColor != null) 'Background': 'Custom Color',
      if (variant == FooterVariant.textOnly && customText != null)
        'Text Length': '${customText.length} chars',
      if (variant != FooterVariant.textOnly && itemCount != null)
        'Items': '$itemCount item${itemCount != 1 ? 's' : ''}',
    };
  }

  /// Get human-readable variant name
  static String _getVariantName(FooterVariant variant) {
    switch (variant) {
      case FooterVariant.defaultFooter:
        return 'Default';
      case FooterVariant.legal:
        return 'Legal';
      case FooterVariant.social:
        return 'Social';
      case FooterVariant.minimal:
        return 'Minimal';
      case FooterVariant.custom:
        return 'Custom';
      case FooterVariant.textOnly:
        return 'Text Only';
    }
  }

  /// Build sample custom items for showcase
  static List<OsmeaFooterItem> buildSampleCustomItems() {
    return [
      OsmeaFooterItem(
        label: 'API Docs',
        description: 'Comprehensive API documentation and examples.',
        icon: Icons.code,
      ),
      OsmeaFooterItem(
        label: 'Support',
        description: '24/7 customer support and assistance.',
        icon: Icons.support_agent,
      ),
      OsmeaFooterItem(
        label: 'Blog',
        description: 'Latest news, updates, and technical articles.',
        icon: Icons.article,
      ),
    ];
  }

  /// Generate sample text for textOnly variant
  static String generateSampleText() {
    return '© 2025 OSMEA Components. Built with Flutter and love. ❤️';
  }
} 