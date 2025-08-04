import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

// Import sections
import '../sections/header_section.dart';

// Import utils
import '../utils/carousel_builder.dart';

/// 🎠 **Carousel Showcase Widget**
/// 
/// Main showcase widget that displays all carousel variations with interactive controls
/// Uses the modular structure with sections and utilities

class CarouselShowcaseWidget extends StatefulWidget {
  final CarouselVariant variant;
  final CarouselSize size;
  final double width;
  final double height;
  final bool showArrows;
  final bool showIndicators;

  final CarouselIndicatorType indicatorType;
  final CarouselAutoPlay autoPlay;
  final double autoPlayInterval;
  final bool loop;
  final bool disabled;
  final double seed;
  final int itemCount;
  final bool showMultiItems;

  const CarouselShowcaseWidget({
    Key? key,
    required this.variant,
    required this.size,
    required this.width,
    required this.height,
    required this.showArrows,
    required this.showIndicators,

    required this.indicatorType,
    required this.autoPlay,
    required this.autoPlayInterval,
    required this.loop,
    required this.disabled,
    required this.seed,
    required this.itemCount,
    required this.showMultiItems,
  }) : super(key: key);

  @override
  State<CarouselShowcaseWidget> createState() => _CarouselShowcaseWidgetState();
}

class _CarouselShowcaseWidgetState extends State<CarouselShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      body: OsmeaComponents.column(
        children: [
          // Header Section
          const CarouselHeaderSection(),
          
          // Configuration Section (at top)
          _buildConfigurationSection(),
          
          // Main Carousel Section
          _buildMainCarouselSection(),
        ],
      ),
    );
  }

  Widget _buildConfigurationSection() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(12),
      child: _buildConfigurationInfo(),
    );
  }

  Widget _buildMainCarouselSection() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(12),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselBuilder.buildSectionTitle('Main Carousel (Controlled by Knobs)'),
          OsmeaComponents.sizedBox(height: 8),
          
          // Main carousel with current knob settings
          _buildMainCarousel(),
        ],
      ),
    );
  }

  Widget _buildMainCarousel() {
    Widget carousel;
    
    // Handle multi variant specially
    if (widget.variant == CarouselVariant.multi) {
      carousel = CarouselBuilder.buildMultiCarousel(
        width: widget.width,
        height: widget.height,
        showArrows: widget.showArrows,
        showIndicators: widget.showIndicators,
                itemCount: widget.itemCount,
      );
    } else {
      // Handle image-based variants
      carousel = CarouselBuilder.buildImageCarousel(
        width: widget.width,
        height: widget.height,
        variant: widget.variant,
        indicatorType: widget.indicatorType,
   
        showArrows: widget.showArrows,
        showIndicators: widget.showIndicators,
        loop: widget.loop,
        autoPlay: widget.autoPlay,
        autoPlayInterval: Duration(seconds: widget.autoPlayInterval.toInt()),
        disabled: widget.disabled,
        seed: widget.seed.toInt(),
        itemCount: widget.itemCount,
      );
    }

    return carousel;
  }

  Widget _buildConfigurationInfo() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: OsmeaColors.silver, width: 1),
        boxShadow: [
          BoxShadow(
            color: OsmeaColors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Current Configuration',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: OsmeaColors.nordicBlue,
          ),
          OsmeaComponents.sizedBox(height: 8),
          _buildConfigRow('Dimensions', '${widget.width.toInt()}x${widget.height.toInt()}'),
          _buildConfigRow('Show Arrows', widget.showArrows ? 'Yes' : 'No'),
          _buildConfigRow('Show Indicators', widget.showIndicators ? 'Yes' : 'No'),
          _buildConfigRow('Indicator Type', _getIndicatorDisplayName(widget.indicatorType)),
          _buildConfigRow('Auto Play', _getAutoPlayDisplayName(widget.autoPlay)),
          _buildConfigRow('Auto Play Interval', '${widget.autoPlayInterval.toInt()}s'),
          _buildConfigRow('Loop', widget.loop ? 'Yes' : 'No'),
          _buildConfigRow('Disabled', widget.disabled ? 'Yes' : 'No'),
          _buildConfigRow('Image Seed', '${widget.seed.toInt()}'),
          _buildConfigRow('Item Count', '${widget.itemCount}'),
        ],
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: OsmeaComponents.row(
        children: [
          OsmeaComponents.text(
            '$label:',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: OsmeaColors.slate,
          ),
          OsmeaComponents.sizedBox(width: 8),
          OsmeaComponents.text(
            value,
            fontSize: 14,
            color: OsmeaColors.nordicBlue,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  String _getVariantDisplayName(CarouselVariant variant) {
    switch (variant) {
      case CarouselVariant.multi:
        return 'Multi';
      case CarouselVariant.modern:
        return 'Modern';
      case CarouselVariant.standard:
        return 'Standard';
      case CarouselVariant.card:
        return 'Card';
      case CarouselVariant.hero:
        return 'Hero';
      case CarouselVariant.minimal:
        return 'Minimal';
      default:
        return 'Unknown';
    }
  }

  String _getSizeDisplayName(CarouselSize size) {
    switch (size) {
      case CarouselSize.extraSmall:
        return 'Extra Small';
      case CarouselSize.small:
        return 'Small';
      case CarouselSize.medium:
        return 'Medium';
      case CarouselSize.large:
        return 'Large';
      default:
        return 'Unknown';
    }
  }

  String _getIndicatorDisplayName(CarouselIndicatorType indicatorType) {
    switch (indicatorType) {
      case CarouselIndicatorType.dot:
        return 'Dot';
      case CarouselIndicatorType.bar:
        return 'Bar';
      case CarouselIndicatorType.rectangle:
        return 'Rectangle';
      case CarouselIndicatorType.gradient:
        return 'Gradient';
      default:
        return 'Unknown';
    }
  }

  String _getAutoPlayDisplayName(CarouselAutoPlay autoPlay) {
    switch (autoPlay) {
      case CarouselAutoPlay.none:
        return 'None';
      case CarouselAutoPlay.continuous:
        return 'Continuous';
      case CarouselAutoPlay.pauseOnHover:
        return 'Pause on Hover';
      default:
        return 'Unknown';
    }
  }
} 