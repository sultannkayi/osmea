import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔄 **Nested Container Section**
/// 
/// Contains the building logic for Example 4: Nested Container
/// Handles complex container compositions

class NestedContainerSection {
  static Widget buildContainer({
    required bool showNestedExample,
    required String nestedContainerType,
  }) {
    switch (nestedContainerType) {
      case 'simple':
        return _buildSimpleNested();
      case 'complex':
        return _buildComplexNested();
      case 'premium':
        return _buildPremiumNested();
      case 'card':
      default:
        return _buildCardNested();
    }
  }

  static Widget _buildSimpleNested() {
    return OsmeaComponents.container(
      width: 160,
      height: 100,
      color: OsmeaColors.sunsetGlow, // Fixed color for this example
      borderRadius: BorderRadius.circular(8), // Fixed border radius
      padding: const EdgeInsets.all(8),
      child: OsmeaComponents.container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4),
        alignment: Alignment.center,
        child: OsmeaComponents.text(
          'Example 4\nSimple Nested',
          color: OsmeaColors.sunsetGlow,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Widget _buildComplexNested() {
    return OsmeaComponents.container(
      width: 160,
      height: 100,
      gradient: LinearGradient(
        colors: [OsmeaColors.deepSea, OsmeaColors.nordicBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.all(6),
      child: OsmeaComponents.container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
        padding: const EdgeInsets.all(4),
        child: OsmeaComponents.container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          alignment: Alignment.center,
          child: OsmeaComponents.text(
            'Example 4\nComplex Nested',
            color: OsmeaColors.deepSea,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  static Widget _buildCardNested() {
    return OsmeaComponents.container(
      width: 160,
      height: 100,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      padding: const EdgeInsets.all(8),
      child: OsmeaComponents.column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OsmeaComponents.container(
            width: double.infinity,
            height: 24,
            color: OsmeaColors.amberFlame,
            borderRadius: BorderRadius.circular(4),
            alignment: Alignment.center,
            child: OsmeaComponents.text(
              'Header',
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          OsmeaComponents.container(
            width: double.infinity,
            height: 40,
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(4),
            alignment: Alignment.center,
            child: OsmeaComponents.text(
              'Example 4\nCard Content',
              color: Colors.grey.shade600,
              fontSize: 10,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPremiumNested() {
    return OsmeaComponents.container(
      width: 160,
      height: 100,
      gradient: LinearGradient(
        colors: [OsmeaColors.atlantic, OsmeaColors.nordicBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.3),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      padding: const EdgeInsets.all(8),
      child: OsmeaComponents.column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Example 4',
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 4),
          OsmeaComponents.container(
            width: double.infinity,
            height: 24,
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(4),
            alignment: Alignment.center,
            child: OsmeaComponents.text(
              'Premium Nested',
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
