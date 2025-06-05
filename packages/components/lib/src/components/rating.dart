import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/component_dimensions.dart';

enum OsmeaRatingStyle { star, heart, thumbs, custom }

class OsmeaRating extends StatelessWidget {
  final double value;
  final int maxRating;
  final OsmeaRatingStyle style;
  final double size;
  final ThemeType themeType;
  final bool readOnly;
  final Function(double)? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final IconData? customIconFilled;
  final IconData? customIconOutlined;
  final bool allowHalfRating;
  final String? semanticsLabel;
  final bool showLabel;
  final TextStyle? labelStyle;

  const OsmeaRating({
    Key? key,
    required this.value,
    this.maxRating = 5,
    this.style = OsmeaRatingStyle.star,
    this.size = 24,
    required this.themeType,
    this.readOnly = false,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.customIconFilled,
    this.customIconOutlined,
    this.allowHalfRating = true,
    this.semanticsLabel,
    this.showLabel = false,
    this.labelStyle,
  })  : assert(value >= 0 && value <= maxRating),
        assert(maxRating > 0),
        assert(
            style != OsmeaRatingStyle.custom ||
                (customIconFilled != null && customIconOutlined != null),
            'customIconFilled and customIconOutlined must be provided for custom style'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? OsmeaColors.warning;
    final effectiveInactiveColor =
        inactiveColor ?? OsmeaColors.border(themeType);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: size / 5,
          children: List.generate(maxRating, (index) {
            final itemValue = index + 1.0;
            final isActive = value >= itemValue;
            final isHalfActive = allowHalfRating &&
                value >= itemValue - 0.5 &&
                value < itemValue;

            return GestureDetector(
              onTap: readOnly ? null : () => onChanged?.call(itemValue),
              onHorizontalDragUpdate: readOnly || !allowHalfRating
                  ? null
                  : (details) {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      final localPosition =
                          box.globalToLocal(details.globalPosition);
                      final rating = _calculateRating(localPosition, box.size);
                      if (rating != null) {
                        onChanged?.call(rating);
                      }
                    },
              child: Semantics(
                label: semanticsLabel ?? 'Rating $value of $maxRating',
                child: _buildRatingItem(isActive, isHalfActive,
                    effectiveActiveColor, effectiveInactiveColor),
              ),
            );
          }),
        ),
        if (showLabel) ...[
          SizedBox(width: ComponentDimensions.spaceS),
          Text(
            value.toString(),
            style: labelStyle ??
                TextStyle(
                  fontSize: size * 0.7,
                  color: OsmeaColors.onSurface(themeType),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildRatingItem(bool isActive, bool isHalfActive, Color activeColor,
      Color inactiveColor) {
    final IconData filledIcon = _getFilledIcon();
    final IconData outlinedIcon = _getOutlinedIcon();

    if (isHalfActive) {
      return Stack(
        children: [
          Icon(
            outlinedIcon,
            size: size,
            color: inactiveColor,
          ),
          ClipRect(
            clipper: _HalfClipper(),
            child: Icon(
              filledIcon,
              size: size,
              color: activeColor,
            ),
          ),
        ],
      );
    }

    return Icon(
      isActive ? filledIcon : outlinedIcon,
      size: size,
      color: isActive ? activeColor : inactiveColor,
    );
  }

  IconData _getFilledIcon() {
    switch (style) {
      case OsmeaRatingStyle.star:
        return Icons.star;
      case OsmeaRatingStyle.heart:
        return Icons.favorite;
      case OsmeaRatingStyle.thumbs:
        return Icons.thumb_up;
      case OsmeaRatingStyle.custom:
        return customIconFilled!;
    }
  }

  IconData _getOutlinedIcon() {
    switch (style) {
      case OsmeaRatingStyle.star:
        return Icons.star_border;
      case OsmeaRatingStyle.heart:
        return Icons.favorite_border;
      case OsmeaRatingStyle.thumbs:
        return Icons.thumb_up_outlined;
      case OsmeaRatingStyle.custom:
        return customIconOutlined!;
    }
  }

  double? _calculateRating(Offset position, Size size) {
    final itemWidth = size.width / maxRating;
    if (position.dx < 0) return 0;
    if (position.dx > size.width) return maxRating.toDouble();

    final rating = position.dx / itemWidth;
    if (allowHalfRating) {
      final roundedRating = (rating * 2).round() / 2;
      return roundedRating.clamp(0.0, maxRating.toDouble());
    } else {
      final roundedRating = rating.round();
      return roundedRating.clamp(0, maxRating).toDouble();
    }
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

// Read-only display variant
class OsmeaRatingDisplay extends StatelessWidget {
  final double value;
  final int maxRating;
  final double size;
  final ThemeType themeType;
  final Color? activeColor;
  final Color? inactiveColor;
  final bool showLabel;
  final TextStyle? labelStyle;

  const OsmeaRatingDisplay({
    Key? key,
    required this.value,
    this.maxRating = 5,
    this.size = 16,
    required this.themeType,
    this.activeColor,
    this.inactiveColor,
    this.showLabel = true,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaRating(
      value: value,
      maxRating: maxRating,
      size: size,
      themeType: themeType,
      readOnly: true,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      showLabel: showLabel,
      labelStyle: labelStyle,
    );
  }
}
