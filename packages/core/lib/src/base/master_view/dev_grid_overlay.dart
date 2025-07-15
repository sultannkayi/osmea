import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Developer grid overlay. Only visible in kDebugMode.
class DevGridOverlay extends StatelessWidget {
  final int columns;
  final double margin;
  final double columnWidth;
  final Color columnColor;
  final Color marginColor;

  const DevGridOverlay({
    super.key,
    this.columns = 5, // 5 grid columns
    this.margin = 16,
    this.columnWidth = 16,
    this.columnColor = const Color.fromARGB(135, 255, 116, 116),
    this.marginColor =
        const Color.fromARGB(33, 52, 7, 149), // lighter/transparent for margin
  });

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return const SizedBox.shrink();
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: _buildGrid(context),
    );
  }

  Widget _buildGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final totalFixed = 2 * margin + columns * columnWidth;
    final gutterCount = columns - 1;
    final gutter =
        gutterCount > 0 ? (screenWidth - totalFixed) / gutterCount : 0.0;

    final labelStyle = TextStyle(
      color: Colors.black.withAlpha((0.7 * 255).toInt()),
      fontSize: 12,
      fontWeight: FontWeight.w500,
      backgroundColor: Colors.white.withAlpha((0.7 * 255).toInt()),
    );

    List<Widget> labels = [];
    // Left margin label (centered in margin)
    labels.add(Positioned(
      left: (margin / 2) - 16,
      top: 0,
      child: SizedBox(
        width: 32,
        child: Center(
            child: Text('${margin.toStringAsFixed(0)}px', style: labelStyle)),
      ),
    ));
    // Column labels (centered in each column)
    for (int i = 0; i < columns; i++) {
      final double colLeft =
          margin + i * (columnWidth + gutter) + (columnWidth / 2) - 16;
      labels.add(Positioned(
        left: colLeft,
        top: 0,
        child: SizedBox(
          width: 32,
          child: Center(
              child: Text('${columnWidth.toStringAsFixed(0)}px',
                  style: labelStyle)),
        ),
      ));
    }
    // Right margin label (centered in margin)
    labels.add(Positioned(
      left: screenWidth - margin + (margin / 2) - 16,
      top: 0,
      child: SizedBox(
        width: 32,
        child: Center(
            child: Text('${margin.toStringAsFixed(0)}px', style: labelStyle)),
      ),
    ));

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            size: Size(screenWidth, double.infinity),
            painter: _FixedWidthGridPainter(
              columns: columns,
              columnWidth: columnWidth,
              gutter: gutter,
              margin: margin,
              columnColor: columnColor,
              marginColor: marginColor,
              screenWidth: screenWidth,
            ),
          ),
          ...labels,
        ],
      ),
    );
  }
}

class _FixedWidthGridPainter extends CustomPainter {
  final int columns;
  final double columnWidth;
  final double gutter;
  final double margin;
  final Color columnColor;
  final Color marginColor;
  final double screenWidth;

  _FixedWidthGridPainter({
    required this.columns,
    required this.columnWidth,
    required this.gutter,
    required this.margin,
    required this.columnColor,
    required this.marginColor,
    required this.screenWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw left margin
    final leftMarginRect = Rect.fromLTWH(0.0, 0.0, margin, size.height);
    canvas.drawRect(leftMarginRect, Paint()..color = marginColor);
    // Draw columns
    final columnPaint = Paint()..color = columnColor;
    for (int i = 0; i < columns; i++) {
      final double left = margin + i * (columnWidth + gutter);
      final rect = Rect.fromLTWH(left, 0.0, columnWidth, size.height);
      canvas.drawRect(rect, columnPaint);
    }
    // Draw right margin
    final rightMarginLeft = screenWidth - margin;
    final rightMarginRect =
        Rect.fromLTWH(rightMarginLeft, 0.0, margin, size.height);
    canvas.drawRect(rightMarginRect, Paint()..color = marginColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
