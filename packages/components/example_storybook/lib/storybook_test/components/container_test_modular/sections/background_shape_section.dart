import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🖼️ **Background & Shape Section**
/// 
/// Contains the building logic for Example 3: Background & Shape Container
/// Handles background images and shape variants

class BackgroundShapeSection {
  static Widget buildContainer({
    required bool hasBackgroundImage,
    required BoxFit backgroundImageFit,
    required BoxShape shape,
  }) {
    return OsmeaComponents.container(
      width: shape == BoxShape.circle ? 120 : 160,
      height: shape == BoxShape.circle ? 120 : 100,
      color: hasBackgroundImage ? null : OsmeaColors.forestHeart, // Fixed color for this example
      shape: shape,
      borderRadius: shape == BoxShape.rectangle 
          ? BorderRadius.circular(8) // Fixed border radius
          : null,
      backgroundImage: hasBackgroundImage ? DecorationImage(
        image: const NetworkImage('https://picsum.photos/200/150'),
        fit: backgroundImageFit,
      ) : null,
      alignment: Alignment.center, // Fixed alignment
      child: hasBackgroundImage ? OsmeaComponents.container(
        color: Colors.black.withValues(alpha: 0.5),
        shape: shape,
        borderRadius: shape == BoxShape.rectangle 
            ? BorderRadius.circular(8) 
            : null,
        alignment: Alignment.center,
        child: OsmeaComponents.text(
          'Example 3\nBackground & Shape',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ) : OsmeaComponents.text(
        'Example 3\nBackground & Shape',
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
    );
  }
}
