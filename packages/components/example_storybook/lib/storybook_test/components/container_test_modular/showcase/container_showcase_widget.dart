import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

// Import section builders
import '../sections/basic_styling_section.dart';
import '../sections/size_gradient_section.dart';
import '../sections/background_shape_section.dart';
import '../sections/nested_container_section.dart';

/// 📦 **Container Showcase Widget**
/// 
/// Simple, clean showcase that displays 4 containers with different focuses
/// Each container responds to specific knobs for focused testing

class UnifiedContainerShowcaseWidget extends StatelessWidget {
  const UnifiedContainerShowcaseWidget({
    Key? key,
    // Example 1: Basic Styling knobs
    required this.color,
    required this.borderRadius,
    required this.hasShadow,
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.hasBorder,
    required this.isInteractive,
    required this.hasLongPress,
    
    // Example 2: Size & Gradient knobs
    this.width,
    this.height,
    required this.useFixedSize,
    required this.hasGradient,
    required this.gradientType,
    
    // Example 3: Background & Shape knobs
    required this.shape,
    required this.hasBackgroundImage,
    required this.backgroundImageFit,
    
    // Example 4: Nested Container knobs
    required this.showNestedExample,
    required this.nestedContainerType,
  }) : super(key: key);

  // Example 1: Basic Styling
  final Color color;
  final double borderRadius;
  final bool hasShadow;
  final Alignment alignment;
  final double padding;
  final double margin;
  final bool hasBorder;
  final bool isInteractive;
  final bool hasLongPress;
  
  // Example 2: Size & Gradient
  final double? width;
  final double? height;
  final bool useFixedSize;
  final bool hasGradient;
  final String gradientType;
  
  // Example 3: Background & Shape
  final BoxShape shape;
  final bool hasBackgroundImage;
  final BoxFit backgroundImageFit;
  
  // Example 4: Nested Container
  final bool showNestedExample;
  final String nestedContainerType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              const Text(
                '📦 Container Features Showcase',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 32),
              
              // 4 Container Examples in a wider layout
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: [
                    // Example 1: Basic Styling
                    _buildFeatureContainer(
                      title: 'Example 1: Basic Styling',
                      description: 'Color • Radius • Shadow • Alignment\nPadding • Margin • Border • Interaction',
                      container: _buildBasicStylingContainer(context),
                    ),

                    // Example 2: Size & Gradient
                    _buildFeatureContainer(
                      title: 'Example 2: Size & Gradient',
                      description: 'Fixed/Dynamic Size • Gradient Types',
                      container: _buildSizeGradientContainer(),
                    ),

                    // Example 3: Background & Shape
                    _buildFeatureContainer(
                      title: 'Example 3: Background & Shape',
                      description: 'Background Image • Shape Variants',
                      container: _buildBackgroundShapeContainer(),
                    ),

                    // Example 4: Nested Container
                    _buildFeatureContainer(
                      title: 'Example 4: Nested Container',
                      description: 'Complex Container Compositions',
                      container: _buildNestedContainer(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Current Configuration Panel
              _buildConfigurationInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureContainer({
    required String title,
    required String description,
    required Widget container,
  }) {
    return Container(
      width: 280, // Increased from 200
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          
          // Container Example - larger container
          Container(
            width: double.infinity,
            height: 180, // Increased from 160
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: container,
            ),
          ),
        ],
      ),
    );
  }

  // Example 1: Basic Styling Container
  Widget _buildBasicStylingContainer(BuildContext context) {
    return BasicStylingSection.buildContainer(
      context,
      color: color,
      borderRadius: borderRadius,
      hasShadow: hasShadow,
      alignment: alignment,
      padding: padding,
      margin: margin,
      hasBorder: hasBorder,
      isInteractive: isInteractive,
      hasLongPress: hasLongPress,
    );
  }

  // Example 2: Size & Gradient Container (ONLY responds to Example 2 knobs)
  Widget _buildSizeGradientContainer() {
    return SizeGradientSection.buildContainer(
      width: width,
      height: height,
      useFixedSize: useFixedSize,
      hasGradient: hasGradient,
      gradientType: gradientType,
    );
  }

  // Example 3: Background & Shape Container (ONLY responds to Example 3 knobs)
  Widget _buildBackgroundShapeContainer() {
    return BackgroundShapeSection.buildContainer(
      hasBackgroundImage: hasBackgroundImage,
      backgroundImageFit: backgroundImageFit,
      shape: shape,
    );
  }

  // Example 4: Nested Container (ONLY responds to Example 4 knobs)
  Widget _buildNestedContainer() {
    return NestedContainerSection.buildContainer(
      showNestedExample: showNestedExample,
      nestedContainerType: nestedContainerType,
    );
  }

  Widget _buildConfigurationInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 800,
        minWidth: 300,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            'Current Configuration',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          
          // Example 1 Configuration
          _buildExampleConfigSection('Example 1: Basic Styling', [
            _buildConfigRow('Color', _getColorName(color)),
            _buildConfigRow('Border Radius', '${borderRadius.toInt()}px'),
            _buildConfigRow('Shadow', hasShadow ? 'Enabled' : 'Disabled'),
            _buildConfigRow('Alignment', _getAlignmentName(alignment)),
            _buildConfigRow('Padding', '${padding.toInt()}px'),
            _buildConfigRow('Margin', '${margin.toInt()}px'),
            _buildConfigRow('Border', hasBorder ? 'Enabled' : 'Disabled'),
            _buildConfigRow('Interactive', isInteractive ? 'Tap enabled' : 'Not interactive'),
            _buildConfigRow('Long Press', hasLongPress ? 'Enabled' : 'Disabled'),
          ]),
          
          const SizedBox(height: 12),
          
          // Example 2 Configuration
          _buildExampleConfigSection('Example 2: Size & Gradient', [
            _buildConfigRow('Width', useFixedSize ? '100px (Fixed)' : '${width?.toInt() ?? 120}px'),
            _buildConfigRow('Height', useFixedSize ? '60px (Fixed)' : '${height?.toInt() ?? 80}px'),
            _buildConfigRow('Size Type', useFixedSize ? 'Fixed' : 'Dynamic'),
            _buildConfigRow('Gradient', hasGradient ? '$gradientType gradient' : 'Solid color'),
          ]),
          
          const SizedBox(height: 12),
          
          // Example 3 Configuration  
          _buildExampleConfigSection('Example 3: Background & Shape', [
            _buildConfigRow('Background', hasBackgroundImage ? 'Image (${backgroundImageFit.name})' : 'Solid color'),
            _buildConfigRow('Shape', shape == BoxShape.circle ? 'Circle' : 'Rectangle'),
          ]),
          
          const SizedBox(height: 12),
          
          // Example 4 Configuration
          _buildExampleConfigSection('Example 4: Nested Container', [
            _buildConfigRow('Show Example', showNestedExample ? 'Yes' : 'No'),
            _buildConfigRow('Nested Type', _formatNestedContainerType(nestedContainerType)),
          ]),
        ],
      ),
    );
  }

  Widget _buildExampleConfigSection(String title, List<Widget> configs) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          ...configs,
        ],
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  String _getColorName(Color color) {
    if (color == OsmeaColors.nordicBlue) return 'Nordic Blue';
    if (color == OsmeaColors.sunsetGlow) return 'Sunset Glow';
    if (color == OsmeaColors.forestHeart) return 'Forest Heart';
    if (color == OsmeaColors.deepSea) return 'Deep Sea';
    if (color == OsmeaColors.amberFlame) return 'Amber Flame';
    if (color == OsmeaColors.goldenHour) return 'Golden Hour';
    if (color == OsmeaColors.springLeaf) return 'Spring Leaf';
    if (color == OsmeaColors.white) return 'White';
    if (color == OsmeaColors.silver) return 'Silver';
    return 'Custom Color';
  }

  String _getAlignmentName(Alignment alignment) {
    if (alignment == Alignment.center) return 'Center';
    if (alignment == Alignment.topLeft) return 'Top Left';
    if (alignment == Alignment.topCenter) return 'Top Center';
    if (alignment == Alignment.topRight) return 'Top Right';
    if (alignment == Alignment.centerLeft) return 'Center Left';
    if (alignment == Alignment.centerRight) return 'Center Right';
    if (alignment == Alignment.bottomLeft) return 'Bottom Left';
    if (alignment == Alignment.bottomCenter) return 'Bottom Center';
    if (alignment == Alignment.bottomRight) return 'Bottom Right';
    return 'Custom Alignment';
  }

  String _formatNestedContainerType(String type) {
    final formatted = type
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    
    // Limit length to prevent overflow
    return formatted.length > 15 ? '${formatted.substring(0, 12)}...' : formatted;
  }
}
