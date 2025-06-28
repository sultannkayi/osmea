/// Enum for divider styles
/// - classic: Solid line
/// - dashed: Dashed line
/// - dotted: Dotted line
/// - gradient: Gradient line
/// - icon: Divider with an icon in the center
/// - double: Double line divider
/// - fade: Fading out at the ends
/// - zigzag: Zigzag line
/// - wave: Wavy line
/// - vertical: Vertical divider (for convenience, but now all variants can be vertical)
/// - angled: Diagonal divider
/// - label: Divider with a text label in the center
///
/// All variants now support a direction parameter: Axis.horizontal (default) or Axis.vertical.

enum DividerVariant {
  classic,
  dashed,
  dotted,
  gradient,
  icon,
  double,
  fade,
  zigzag,
  wave,
  vertical,
  angled,
  label,
}
