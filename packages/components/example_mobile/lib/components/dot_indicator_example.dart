import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/common_appbar.dart';

/// 🔴 Dot Indicator Examples
///
/// Mobile-first showcase of the dot indicator component with responsive design
class DotIndicatorExample extends StatefulWidget {
  const DotIndicatorExample({Key? key}) : super(key: key);

  @override
  State<DotIndicatorExample> createState() => _DotIndicatorExampleState();
}

class _DotIndicatorExampleState extends State<DotIndicatorExample> {
  int _sizeCurrentIndex = 2; // Medium
  int _styleCurrentIndex = 1;
  int _mainIndex = 2;
  int _customColorIndex = 1;

  // Safe index update method to prevent overflow
  void _updateIndex(int newIndex, Function(int) setter, [int maxCount = 5]) {
    setter(newIndex % maxCount);
  }

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      backgroundColor: OsmeaColors.snow,
      appBar: const OsmeaComponentsAppBar(
        screenKey: 'dot_indicator_example',
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(6), // Aggressively reduced for mobile
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            OsmeaComponents.sizedBox(height: 12), // Further reduced for mobile
            _buildSection(
              icon: Icons.favorite,
              title: 'Featured',
              subtitle: 'Heart pulse effect',
              child: _buildHeartPulseCard(),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildSection(
              icon: Icons.crop_landscape,
              title: 'Rectangle',
              subtitle: 'Modern pill shapes',
              child: _buildRectangleCard(),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildSection(
              icon: Icons.arrow_forward,
              title: 'Arrow',
              subtitle: 'Directional indicators',
              child: _buildArrowCard(),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildSection(
              icon: Icons.photo_size_select_small,
              title: 'Sizes',
              subtitle: 'From small to large',
              child: _buildSizeGallery(),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildSection(
              icon: Icons.style,
              title: 'Styles',
              subtitle: 'Visual treatments',
              child: _buildStyleGallery(),
            ),
            OsmeaComponents.sizedBox(height: 12),
            _buildSection(
              icon: Icons.tune,
              title: 'Advanced',
              subtitle: 'Custom configs',
              child: _buildAdvancedExamples(),
            ),
            OsmeaComponents.sizedBox(height: 24), // Reduced from 40
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(8), // Further reduced for mobile
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            OsmeaColors.nordicBlue.withValues(alpha: 0.1),
            OsmeaColors.azureWave.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(12), // Reduced from 16
        border: Border.all(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.row(
            children: [
              Icon(
                Icons.radio_button_checked,
                color: OsmeaColors.nordicBlue,
                size: 24, // Reduced from 28
              ),
              OsmeaComponents.sizedBox(width: 8), // Reduced from 12
              OsmeaComponents.expanded(
                child: Text(
                  'Dot Indicator Component',
                  style: TextStyle(
                    fontSize: 16, // Further reduced for mobile
                    fontWeight: FontWeight.w700,
                    color: OsmeaColors.nordicBlue,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          OsmeaComponents.sizedBox(height: 8), // Reduced from 12
          Text(
            'Professional indicator component for carousels and navigation.',
            style: TextStyle(
              fontSize: 12,
              color: OsmeaColors.slate,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          OsmeaComponents.sizedBox(height: 16), // Reduced from 20
          OsmeaComponents.center(
            child: OsmeaComponents.dotIndicator(
              itemCount: 5,
              currentIndex: _mainIndex,
              variant: DotIndicatorVariant.primary,
              size: DotIndicatorSize.medium,
              spacing: 8,
              shape: DotIndicatorShape.circle,
              onDotTapped: (index) =>         _updateIndex(
            index, (i) => setState(() => _mainIndex = i)),
            ),
          ),
          OsmeaComponents.sizedBox(height: 12), // Reduced from 16
          OsmeaComponents.center(
            child: Text(
              'Tap any dot to interact',
              style: TextStyle(
                fontSize: 12, // Reduced from 14
                color: OsmeaColors.steel,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.row(
          children: [
            Container(
              padding: const EdgeInsets.all(6), // Reduced from 8
              decoration: BoxDecoration(
                color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6), // Reduced from 8
              ),
              child: Icon(
                icon,
                color: OsmeaColors.nordicBlue,
                size: 16, // Reduced from 20
              ),
            ),
            OsmeaComponents.sizedBox(width: 8), // Reduced from 12
            OsmeaComponents.expanded(
              child: OsmeaComponents.column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: OsmeaColors.steel,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        OsmeaComponents.sizedBox(height: 12), // Reduced from 16
        child,
      ],
    );
  }

  Widget _buildHeartPulseCard() {
    return _buildInteractiveCard(
      title: '💓 Heart Pulse',
      description: 'Animated hearts',
      itemCount: 5,
      currentIndex: _mainIndex,
      onTap: (index) =>
          _updateIndex(index, (i) => setState(() => _mainIndex = i)),
      builder: () => OsmeaComponents.dotIndicator(
        itemCount: 5,
        currentIndex: _mainIndex,
        animation: DotIndicatorAnimation.pulse,
        shape: DotIndicatorShape.heart,
        variant: DotIndicatorVariant.danger,
        size: DotIndicatorSize.medium,
        spacing: 10,
        onDotTapped: (index) =>
            _updateIndex(index, (i) => setState(() => _mainIndex = i)),
      ),
    );
  }

  Widget _buildRectangleCard() {
    return _buildInteractiveCard(
      title: '📄 Rectangle',
      description: 'Modern pill shapes',
      itemCount: 5,
      currentIndex: _styleCurrentIndex,
      onTap: (index) =>
          _updateIndex(index, (i) => setState(() => _styleCurrentIndex = i)),
      builder: () => OsmeaComponents.dotIndicator(
        itemCount: 5,
        currentIndex: _styleCurrentIndex,
        animation: DotIndicatorAnimation.scale,
        shape: DotIndicatorShape.rectangle,
        variant: DotIndicatorVariant.secondary,
        size: DotIndicatorSize.medium,
        spacing: 12,
        onDotTapped: (index) =>
            _updateIndex(index, (i) => setState(() => _styleCurrentIndex = i)),
      ),
    );
  }

  Widget _buildArrowCard() {
    return _buildInteractiveCard(
      title: '➡️ Arrow',
      description: 'Directional indicators',
      itemCount: 5,
      currentIndex: _customColorIndex,
      onTap: (index) =>
          _updateIndex(index, (i) => setState(() => _customColorIndex = i)),
      builder: () => OsmeaComponents.dotIndicator(
        itemCount: 5,
        currentIndex: _customColorIndex,
        animation: DotIndicatorAnimation.slide,
        shape: DotIndicatorShape.arrow,
        variant: DotIndicatorVariant.info,
        size: DotIndicatorSize.medium,
        spacing: 14,
        onDotTapped: (index) =>
            _updateIndex(index, (i) => setState(() => _customColorIndex = i)),
      ),
    );
  }

  Widget _buildSizeGallery() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(6), // Further reduced for mobile
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(12), // Reduced from 16
        boxShadow: const [
          BoxShadow(
            color: OsmeaColors.shadowLight,
            blurRadius: 6, // Reduced from 12
            offset: Offset(0, 2), // Reduced from (0, 4)
          ),
        ],
      ),
      child: OsmeaComponents.column(
        children: [
          _buildSizeRow('Extra Small', DotIndicatorSize.extraSmall, 'XS'),
          OsmeaComponents.sizedBox(height: 6), // Further reduced for mobile
          _buildSizeRow('Small', DotIndicatorSize.small, 'S'),
          OsmeaComponents.sizedBox(height: 6),
          _buildSizeRow('Medium', DotIndicatorSize.medium, 'M'),
          OsmeaComponents.sizedBox(height: 6),
          _buildSizeRow('Large', DotIndicatorSize.large, 'L'),
        ],
      ),
    );
  }

  Widget _buildSizeRow(String name, DotIndicatorSize size, String shortName) {
    return OsmeaComponents.row(
      children: [
        OsmeaComponents.container(
          width: 24, // Further reduced for mobile
          height: 24, // Further reduced for mobile
          decoration: BoxDecoration(
            color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6), // Reduced from 8
          ),
          child: OsmeaComponents.center(
            child: Text(
              shortName,
              style: TextStyle(
                fontSize: 10, // Reduced from 12
                fontWeight: FontWeight.w600,
                color: OsmeaColors.nordicBlue,
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(width: 12), // Reduced from 16
        OsmeaComponents.expanded(
          child: OsmeaComponents.text(
            name,
            textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        OsmeaComponents.dotIndicator(
          itemCount: 5,
          currentIndex: _sizeCurrentIndex,
          size: size,
          variant: DotIndicatorVariant.primary,
          onDotTapped: (index) =>
              _updateIndex(index, (i) => setState(() => _sizeCurrentIndex = i)),
        ),
      ],
    );
  }

  Widget _buildStyleGallery() {
    final styles = [
      {'name': 'Filled', 'style': DotIndicatorStyle.filled},
      {'name': 'Outlined', 'style': DotIndicatorStyle.outlined},
      {'name': 'Soft', 'style': DotIndicatorStyle.soft},
      {'name': 'Bold', 'style': DotIndicatorStyle.bold},
      {'name': 'Glassmorphism', 'style': DotIndicatorStyle.glassmorphism},
      {'name': 'Neumorphism', 'style': DotIndicatorStyle.neumorphism},
      {'name': 'Material', 'style': DotIndicatorStyle.material},
      {'name': 'Minimal', 'style': DotIndicatorStyle.minimal},
    ];

    return OsmeaComponents.column(
      children: styles.map((styleData) {
        return OsmeaComponents.container(
          margin: const EdgeInsets.only(bottom: 8),
          child: _buildStyleCard(
            name: styleData['name'] as String,
            style: styleData['style'] as DotIndicatorStyle,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStyleCard({
    required String name,
    required DotIndicatorStyle style,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: style == DotIndicatorStyle.neumorphism
            ? OsmeaColors.ash
            : OsmeaColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: OsmeaColors.shadowLight,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Material(
        color: OsmeaColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _updateIndex(_styleCurrentIndex + 1,
              (i) => setState(() => _styleCurrentIndex = i)),
          child: OsmeaComponents.padding(
            padding: const EdgeInsets.all(12),
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OsmeaComponents.flexible(
                      child: OsmeaComponents.text(
                        name,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: OsmeaColors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    OsmeaComponents.container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: OsmeaComponents.text(
                        '${_styleCurrentIndex + 1}/5',
                        textStyle: TextStyle(
                          fontSize: 10,
                          color: OsmeaColors.nordicBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OsmeaComponents.sizedBox(height: 12),
                OsmeaComponents.center(
                  child: OsmeaComponents.dotIndicator(
                    itemCount: 5,
                    currentIndex: _styleCurrentIndex,
                    style: style,
                    size: DotIndicatorSize.medium,
                    spacing: 8,
                    variant: DotIndicatorVariant.primary,
                    onDotTapped: (index) => _updateIndex(
                        index, (i) => setState(() => _styleCurrentIndex = i)),
                  ),
                ),
                OsmeaComponents.sizedBox(height: 8),
                OsmeaComponents.center(
                  child: OsmeaComponents.text(
                    'Tap to try',
                    textStyle: TextStyle(
                      fontSize: 11,
                      color: OsmeaColors.steel,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdvancedExamples() {
    return OsmeaComponents.column(
      children: [
        _buildCustomColorCard(),
      ],
    );
  }

  Widget _buildCustomColorCard() {
    return _buildInteractiveCard(
      title: '🎨 Custom Colors',
      description: 'Purple theme',
      itemCount: 5,
      currentIndex: _customColorIndex,
      onTap: (index) =>
          _updateIndex(index, (i) => setState(() => _customColorIndex = i)),
      builder: () => OsmeaComponents.dotIndicator(
        itemCount: 5,
        currentIndex: _customColorIndex,
        variant: DotIndicatorVariant.custom,
        customActiveColor: Colors.purple.shade600,
        customInactiveColor: Colors.purple.withValues(alpha: 0.3),
        size: DotIndicatorSize.medium,
        spacing: 8,
        onDotTapped: (index) =>
            _updateIndex(index, (i) => setState(() => _customColorIndex = i)),
      ),
    );
  }

  Widget _buildInteractiveCard({
    required String title,
    required String description,
    required int itemCount,
    required int currentIndex,
    required Function(int) onTap,
    required Widget Function() builder,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: OsmeaColors.shadowLight,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
        ),
      ),
      child: Material(
        color: OsmeaColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onTap((currentIndex + 1) % 5),
          child: OsmeaComponents.padding(
            padding: const EdgeInsets.all(12),
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: OsmeaComponents.column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OsmeaComponents.text(
                            title,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: OsmeaColors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          OsmeaComponents.sizedBox(height: 2),
                          OsmeaComponents.text(
                            description,
                            textStyle: TextStyle(
                              fontSize: 11,
                              color: OsmeaColors.steel,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    OsmeaComponents.container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: OsmeaColors.nordicBlue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: OsmeaComponents.text(
                        '${currentIndex + 1}/$itemCount',
                        textStyle: TextStyle(
                          fontSize: 10,
                          color: OsmeaColors.nordicBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                OsmeaComponents.sizedBox(height: 12),
                OsmeaComponents.center(child: builder()),
                OsmeaComponents.sizedBox(height: 8),
                OsmeaComponents.center(
                  child: OsmeaComponents.text(
                    'Tap to try',
                    textStyle: TextStyle(
                      fontSize: 11,
                      color: OsmeaColors.steel,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
