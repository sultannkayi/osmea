import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/osmea_components.dart';

class ColorsExample extends StatelessWidget {
  const ColorsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text(
          'OSMEA Colors Palette',
          variant: OsmeaTextVariant.headlineMedium,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: context.paddingNormal,
        child: SafeArea(
          child: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.text(
                'Primary Colors',
                variant: OsmeaTextVariant.headlineSmall,
              ),
              OsmeaComponents.sizedBox(height: 16),
              _buildColorSection([
                _ColorInfo('Nordic Blue', OsmeaColors.nordicBlue, '#2C5F5D'),
                _ColorInfo('Atlantic', OsmeaColors.atlantic, '#1A4A48'),
                _ColorInfo('Deep Sea', OsmeaColors.deepSea, '#0F3634'),
                _ColorInfo('Crystal Bay', OsmeaColors.crystalBay, '#4A8B87'),
              ]),
              OsmeaComponents.sizedBox(height: 24),
              OsmeaComponents.text(
                'Accent Colors',
                variant: OsmeaTextVariant.headlineSmall,
              ),
              OsmeaComponents.sizedBox(height: 16),
              _buildColorSection([
                _ColorInfo('Sunset Glow', OsmeaColors.sunsetGlow, '#F4A261'),
                _ColorInfo('Amber Flame', OsmeaColors.amberFlame, '#E76F51'),
                _ColorInfo('Golden Hour', OsmeaColors.goldenHour, '#F9C74F'),
              ]),
              OsmeaComponents.sizedBox(height: 24),
              OsmeaComponents.text(
                'Nature Colors',
                variant: OsmeaTextVariant.headlineSmall,
              ),
              OsmeaComponents.sizedBox(height: 16),
              _buildColorSection([
                _ColorInfo('Forest Heart', OsmeaColors.forestHeart, '#43AA8B'),
                _ColorInfo('Pine Grove', OsmeaColors.pineGrove, '#277DA1'),
                _ColorInfo('Spring Leaf', OsmeaColors.springLeaf, '#90E0EF'),
              ]),
              OsmeaComponents.sizedBox(height: 24),
              OsmeaComponents.text(
                'Neutral Colors',
                variant: OsmeaTextVariant.headlineSmall,
              ),
              OsmeaComponents.sizedBox(height: 16),
              _buildColorSection([
                const _ColorInfo('White', OsmeaColors.white, '#FFFFFF'),
                _ColorInfo('Snow', OsmeaColors.snow, '#F8F9FA'),
                _ColorInfo('Silver', OsmeaColors.silver, '#E9ECEF'),
                _ColorInfo('Ash', OsmeaColors.ash, '#DEE2E6'),
                _ColorInfo('Steel', OsmeaColors.steel, '#ADB5BD'),
                _ColorInfo('Pewter', OsmeaColors.pewter, '#6C757D'),
                _ColorInfo('Slate', OsmeaColors.slate, '#495057'),
                _ColorInfo('Shark', OsmeaColors.shark, '#343A40'),
                _ColorInfo('Eclipse', OsmeaColors.eclipse, '#212529'),
              ]),
              OsmeaComponents.sizedBox(height: 24),
              OsmeaComponents.text(
                'Special Colors',
                variant: OsmeaTextVariant.headlineSmall,
              ),
              OsmeaComponents.sizedBox(height: 16),
              _buildColorSection([
                const _ColorInfo(
                    'Transparent', OsmeaColors.transparent, 'Transparent'),
                const _ColorInfo(
                    'Shadow Light', OsmeaColors.shadowLight, 'rgba(0,0,0,0.1)'),
                const _ColorInfo(
                    'Shadow Dark', OsmeaColors.shadowDark, 'rgba(0,0,0,0.3)'),
              ]),
              OsmeaComponents.sizedBox(height: 32),
              OsmeaComponents.container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      OsmeaColors.crystalBay.withValues(
                          red: 74, green: 139, blue: 135, alpha: 0.1),
                      OsmeaColors.sunsetGlow.withValues(
                          red: 244, green: 162, blue: 97, alpha: 0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: OsmeaColors.silver),
                ),
                child: OsmeaComponents.column(
                  children: [
                    Icon(
                      Icons.palette,
                      color: OsmeaColors.nordicBlue,
                      size: 40,
                    ),
                    OsmeaComponents.sizedBox(height: 12),
                    OsmeaComponents.text(
                      'OSMEA Design System Colors',
                      variant: OsmeaTextVariant.titleMedium,
                      color: OsmeaColors.nordicBlue,
                      textAlign: TextAlign.center,
                    ),
                    OsmeaComponents.sizedBox(height: 8),
                    OsmeaComponents.text(
                      'Tap any color card to copy its hex value to clipboard',
                      variant: OsmeaTextVariant.bodyMedium,
                      color: OsmeaColors.pewter,
                      textAlign: TextAlign.center,
                    ),
                    OsmeaComponents.sizedBox(height: 4),
                    OsmeaComponents.text(
                      'Perfect for designers and developers',
                      variant: OsmeaTextVariant.captionMedium,
                      color: OsmeaColors.steel,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              OsmeaComponents.sizedBox(height: 24),
              _buildColorUsageGuide(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorSection(List<_ColorInfo> colors) {
    return OsmeaComponents.wrap(
      spacing: 12,
      runSpacing: 12,
      children: colors.map((colorInfo) => _buildColorCard(colorInfo)).toList(),
    );
  }

  Widget _buildColorCard(_ColorInfo colorInfo) {
    return GestureDetector(
      onTap: () => _copyToClipboard(colorInfo),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 160,
        height: 140,
        decoration: BoxDecoration(
          color: colorInfo.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorInfo.color == OsmeaColors.white ||
                    colorInfo.color == OsmeaColors.transparent
                ? OsmeaColors.silver
                : OsmeaColors.transparent,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: OsmeaColors.shadowLight,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: OsmeaComponents.stack(
          children: [
            if (colorInfo.color == OsmeaColors.transparent)
              OsmeaComponents.container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: OsmeaColors.silver,
                ),
                child: CustomPaint(
                  painter: _CheckerboardPainter(),
                  child: OsmeaComponents.container(),
                ),
              ),
            OsmeaComponents.positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: OsmeaComponents.container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _getContrastColor(colorInfo.color),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: OsmeaComponents.column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OsmeaComponents.text(
                      colorInfo.name,
                      variant: OsmeaTextVariant.labelLarge,
                      color: _getTextColor(colorInfo.color),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                    OsmeaComponents.sizedBox(height: 6),
                    OsmeaComponents.text(
                      colorInfo.hex,
                      variant: OsmeaTextVariant.captionLarge,
                      color: _getTextColor(colorInfo.color),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'monospace',
                    ),
                  ],
                ),
              ),
            ),
            OsmeaComponents.positioned(
              top: 12,
              right: 12,
              child: OsmeaComponents.container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getContrastColor(colorInfo.color),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.content_copy,
                  size: 18,
                  color: _getTextColor(colorInfo.color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorUsageGuide() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: OsmeaColors.snow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: OsmeaColors.ash),
      ),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Color Usage Guide',
            variant: OsmeaTextVariant.titleMedium,
            color: OsmeaColors.shark,
          ),
          OsmeaComponents.sizedBox(height: 16),
          _buildUsageItem(
            '🔵 Primary Colors',
            'Use for main branding, primary buttons, and key interface elements',
            OsmeaColors.nordicBlue,
          ),
          _buildUsageItem(
            '🟠 Accent Colors',
            'For highlights, warnings, and drawing attention to important elements',
            OsmeaColors.sunsetGlow,
          ),
          _buildUsageItem(
            '🟢 Nature Colors',
            'Success states, confirmations, and positive feedback',
            OsmeaColors.forestHeart,
          ),
          _buildUsageItem(
            '⚫ Neutral Colors',
            'Text, backgrounds, borders, and general UI elements',
            OsmeaColors.pewter,
          ),
        ],
      ),
    );
  }

  Widget _buildUsageItem(String title, String description, Color color) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OsmeaComponents.row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: OsmeaColors.silver),
            ),
          ),
          OsmeaComponents.sizedBox(width: 12),
          OsmeaComponents.expanded(
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.text(
                  title,
                  variant: OsmeaTextVariant.labelMedium,
                  color: OsmeaColors.shark,
                  fontWeight: FontWeight.w600,
                ),
                OsmeaComponents.sizedBox(height: 4),
                OsmeaComponents.text(
                  description,
                  variant: OsmeaTextVariant.captionMedium,
                  color: OsmeaColors.pewter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getContrastColor(Color color) {
    // Always use white background for the label area to ensure readability
    return OsmeaColors.white;
  }

  Color _getTextColor(Color backgroundColor) {
    // Always use dark text on the white label background for high contrast
    return OsmeaColors.eclipse;
  }

  void _copyToClipboard(_ColorInfo colorInfo) {
    Clipboard.setData(ClipboardData(text: colorInfo.hex));
    // In a real app, you could show a SnackBar here for feedback
  }
}

class _ColorInfo {
  final String name;
  final Color color;
  final String hex;

  const _ColorInfo(this.name, this.color, this.hex);
}

class _CheckerboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = OsmeaColors.white;
    const squareSize = 10.0;

    for (int i = 0; i < (size.width / squareSize).ceil(); i++) {
      for (int j = 0; j < (size.height / squareSize).ceil(); j++) {
        if ((i + j) % 2 == 0) {
          canvas.drawRect(
            Rect.fromLTWH(
              i * squareSize,
              j * squareSize,
              squareSize,
              squareSize,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
