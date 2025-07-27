import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🦶 **Footer Descriptions - Data Layer**
/// 
/// Static data containing descriptions for all footer variants and configurations
/// Used across the modular showcase components

class FooterDescriptions {
  // Variant descriptions
  static const Map<FooterVariant, String> variantDescriptions = {
    FooterVariant.defaultFooter: 'Default footer with standard links: About, Legal, and Contact sections.',
    FooterVariant.legal: 'Legal footer containing Terms of Service, Privacy Policy, and Cookie Policy.',
    FooterVariant.social: 'Social footer with links to social media platforms and community resources.',
    FooterVariant.minimal: 'Minimal footer with essential links only for clean, simple designs.',
    FooterVariant.custom: 'Custom footer allowing full customization of items and content.',
    FooterVariant.textOnly: 'Text-only footer displaying simple copyright or informational text.',
  };

  // Usage contexts
  static const Map<String, String> usageContexts = {
    'website': 'Website Footer - Standard footer for websites and landing pages',
    'app': 'Mobile App - Footer for mobile applications and responsive designs',
    'dashboard': 'Dashboard - Footer for admin panels and dashboards',
    'portfolio': 'Portfolio - Footer for personal and professional portfolios',
    'ecommerce': 'E-commerce - Footer for online stores and shopping platforms',
    'blog': 'Blog - Footer for blogs and content-focused sites',
  };

  // Design patterns
  static const Map<String, String> designPatterns = {
    'informational': 'Informational - Providing essential information and links',
    'navigational': 'Navigational - Helping users navigate to important sections',
    'legal': 'Legal - Displaying legal information and compliance links',
    'social': 'Social - Connecting users to social media and community',
    'contact': 'Contact - Providing contact information and support links',
  };

  // Content types
  static const Map<String, String> contentTypes = {
    'links': 'Links - Clickable links to different pages or sections',
    'text': 'Text - Static text content like copyright notices',
    'mixed': 'Mixed - Combination of links and text content',
    'interactive': 'Interactive - Interactive elements like forms or buttons',
  };

  // Get description for a variant
  static String getVariantDescription(FooterVariant variant) {
    return variantDescriptions[variant] ?? 'Unknown variant';
  }

  // Get usage context description
  static String getUsageContext(String context) {
    return usageContexts[context] ?? 'Unknown context';
  }

  // Get design pattern description
  static String getDesignPattern(String pattern) {
    return designPatterns[pattern] ?? 'Unknown pattern';
  }

  // Get content type description
  static String getContentType(String type) {
    return contentTypes[type] ?? 'Unknown type';
  }
}

/// 🦶 **Footer Variant Names**
/// 
/// Human-readable names for Footer variants
/// Used for display purposes in UI
class FooterVariantNames {
  static const Map<FooterVariant, String> names = {
    FooterVariant.defaultFooter: 'Default',
    FooterVariant.legal: 'Legal',
    FooterVariant.social: 'Social',
    FooterVariant.minimal: 'Minimal',
    FooterVariant.custom: 'Custom',
    FooterVariant.textOnly: 'Text Only',
  };

  static String getName(FooterVariant variant) {
    return names[variant] ?? 'Unknown';
  }
}

/// 🦶 **Default Footer Items**
/// 
/// Pre-defined footer items for different variants
class DefaultFooterItems {
  static List<OsmeaFooterItem> getItemsForVariant(FooterVariant variant) {
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
} 