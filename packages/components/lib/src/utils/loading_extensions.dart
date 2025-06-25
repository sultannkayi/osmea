/// 🔄 OSMEA Loading Extensions
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Extensions for LoadingType, LoadingSize, and LoadingVariant.
///
/// {@category Utils}
/// {@subCategory Loading}
///
/// Example usage:
/// ```dart
/// LoadingType.rotatingDots.osmeaLoading(size: 36, color: Colors.blue);
/// ```

import 'package:flutter/material.dart';
import 'package:osmea_components/src/enums/loading_enums.dart';
import 'package:flutter/widgets.dart';
import '../components/loading/loading.dart';
import '../components/loading/cubit/loading_cubit.dart';

/// Extension for size and stroke width of loading indicators.
extension LoadingSizeExtension on LoadingSize {
  /// Returns the pixel size for the loading indicator.
  double get loadingSize {
    switch (this) {
      case LoadingSize.extraSmall:
        return 16.0;
      case LoadingSize.small:
        return 24.0;
      case LoadingSize.medium:
        return 32.0;
      case LoadingSize.large:
        return 48.0;
      case LoadingSize.extraLarge:
        return 64.0;
    }
  }

  /// Returns the stroke width for the loading indicator.
  double get loadingStroke {
    switch (this) {
      case LoadingSize.extraSmall:
        return 2.0;
      case LoadingSize.small:
        return 2.5;
      case LoadingSize.medium:
        return 3.0;
      case LoadingSize.large:
        return 4.0;
      case LoadingSize.extraLarge:
        return 5.0;
    }
  }
}

/// Extension for LoadingType utilities and widget builder.
extension LoadingTypeExtension on LoadingType {
  /// Builds the loading widget for this type.
  Widget osmeaLoading({
    double size = 32,
    Color? color,
    LoadingCubit? cubit,
  }) {
    final cubit0 = cubit ?? LoadingCubit();
    cubit0.setType(this);
    cubit0.setSize(size);
    if (color != null) cubit0.setColor(color);
    return CoreLoadingWidget(cubit: cubit0);
  }

  /// Returns a human-readable label for this loading type.
  String get label {
    switch (this) {
      case LoadingType.circularFade:
        return 'Circular Fade';
      case LoadingType.bouncingDots:
        return 'Bouncing Dots';
      case LoadingType.waveBars:
        return 'Wave Bars';
      case LoadingType.chasingDots:
        return 'Chasing Dots';
      case LoadingType.dualRing:
        return 'Dual Ring';
      case LoadingType.zigzagDots:
        return 'Zigzag Dots';
      case LoadingType.tripleBounce:
        return 'Triple Bounce';
      case LoadingType.dotCircle:
        return 'Dot Circle';
      case LoadingType.barLoader:
        return 'Bar Loader';
      case LoadingType.fadingCircle:
        return 'Fading Circle';
      case LoadingType.rotatingDots:
        return 'Rotating Dots';
      case LoadingType.dancingSquares:
        return 'Dancing Squares';
      case LoadingType.atom:
        return 'Atom';
      case LoadingType.orbitDot:
        return 'Orbit Dot';
      case LoadingType.spiral:
        return 'Spiral';
      case LoadingType.rotatingArcs:
        return 'Rotating Arcs';
      case LoadingType.gridPulse:
        return 'Grid Pulse';
      case LoadingType.arcLoader:
        return 'Arc Loader';
      case LoadingType.dotFlash:
        return 'Dot Flash';
      case LoadingType.barWave:
        return 'Bar Wave';
    }
  }
}
