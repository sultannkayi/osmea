import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';

enum OsmeaSkeletonType { rectangle, circle, text }

class OsmeaSkeletonLoader extends StatefulWidget {
  final double width;
  final double height;
  final OsmeaSkeletonType type;
  final BorderRadius? borderRadius;
  final ThemeType themeType;

  const OsmeaSkeletonLoader({
    Key? key,
    this.width = double.infinity,
    required this.height,
    this.type = OsmeaSkeletonType.rectangle,
    this.borderRadius,
    required this.themeType,
  }) : super(key: key);

  @override
  _OsmeaSkeletonLoaderState createState() => _OsmeaSkeletonLoaderState();
}

class _OsmeaSkeletonLoaderState extends State<OsmeaSkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius;

    switch (widget.type) {
      case OsmeaSkeletonType.circle:
        borderRadius = BorderRadius.circular(widget.height / 2);
        break;
      case OsmeaSkeletonType.text:
        borderRadius = BorderRadius.circular(4.0);
        break;
      case OsmeaSkeletonType.rectangle:
      default:
        borderRadius = widget.borderRadius ?? BorderRadius.circular(8.0);
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: OsmeaColors.border(widget.themeType)
                .withOpacity(_animation.value * 0.5),
          ),
        );
      },
    );
  }
}

/// Helper for creating common skeleton loading patterns
class OsmeaSkeletonLoaders {
  /// Creates a product card skeleton
  static Widget productCard(ThemeType themeType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaSkeletonLoader(
          height: 200.0,
          themeType: themeType,
        ),
        const SizedBox(height: 8.0),
        OsmeaSkeletonLoader(
          height: 16.0,
          width: 150.0,
          type: OsmeaSkeletonType.text,
          themeType: themeType,
        ),
        const SizedBox(height: 8.0),
        OsmeaSkeletonLoader(
          height: 24.0,
          width: 100.0,
          type: OsmeaSkeletonType.text,
          themeType: themeType,
        ),
      ],
    );
  }
}
