import 'package:osmea_components/src/core/fitted_box_widget.dart';

/// 📏 **OSMEA FittedBox** - Scale and fit child widget
///
/// Creates a widget that scales and positions its child within itself 
/// according to fit and alignment.
/// Useful for scaling images, icons, or any widget to fit available space.
///
/// Features:
/// * 📏 Multiple fit modes (contain, cover, fill, fitWidth, fitHeight, none, scaleDown)
/// * 🎯 Customizable alignment options
/// * ✂️ Optional clipping behavior
/// * 🎨 Responsive scaling and positioning
///
/// Example:
/// ```dart
/// OsmeaComponents.fittedBox(
///   fit: BoxFit.contain,
///   alignment: Alignment.center,
///   child: Image.asset('assets/logo.png'),
/// )
/// ```
///
/// @category Layout Components
/// @subcategory Fitting

class OsmeaFittedBox extends CoreFittedBox {
  const OsmeaFittedBox({
    super.key,
    super.customTheme,
    super.fit,
    super.alignment,
    super.clipBehavior,
    super.child,
  });
} 