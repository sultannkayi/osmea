import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🏷️ Badge Examples
///
/// This example page demonstrates all the available badge variants
/// in the OSMEA Components Library with different configurations.
class BadgeExample extends StatefulWidget {
  const BadgeExample({Key? key}) : super(key: key);

  @override
  State<BadgeExample> createState() => _BadgeExampleState();
}

class _BadgeExampleState extends State<BadgeExample> {
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      backgroundColor: OsmeaColors.white,
      appBar: AppBar(
        title: const Text('Badge Examples'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            _buildIntroductionSection(),

            const SizedBox(height: 36),
            _buildSectionTitle('Badge Styles'),
            _buildStyleShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Standard Badge Variants'),
            _buildVariantShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Badge Sizes'),
            _buildSizeShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Badge Shapes'),
            _buildShapeShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Badge States'),
            _buildStateShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Badge with Icons'),
            _buildIconShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Badge Positions'),
            _buildPositionShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Interactive Badges'),
            _buildInteractiveShowcase(),

            const SizedBox(height: 24),
            _buildSectionTitle('Dot Badges'),
            _buildDotBadgeShowcase(),

            const SizedBox(height: 100), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildIntroductionSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🏷️ OSMEA Badge Component',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: OsmeaColors.nordicBlue,
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Modern, minimalist badges for notifications, labels, and status indicators',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.4,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 30),

          // Feature showcase in a grid
          Wrap(
            spacing: 20,
            runSpacing: 30,
            children: [
              _buildFeatureItem(
                title: 'Style Variants',
                description: 'Soft, normal, outlined, ghost, and mixed styles',
                badge: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OsmeaComponents.badge(
                      content: 'Soft',
                      shape: BadgeShape.pill,
                      style: BadgeStyle.soft,
                      variant: BadgeVariant.primary,
                    ),
                    const SizedBox(width: 8),
                    OsmeaComponents.badge(
                      content: 'Normal',
                      shape: BadgeShape.pill,
                      style: BadgeStyle.normal,
                      variant: BadgeVariant.primary,
                    ),
                  ],
                ),
              ),
              _buildFeatureItem(
                title: 'Content Types',
                description: 'Text, numbers, dots, and icons',
                badge: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OsmeaComponents.badge(
                      content: '42',
                      variant: BadgeVariant.success,
                      style: BadgeStyle
                          .normal, // Normal style for better visibility
                    ),
                    const SizedBox(width: 8),
                    OsmeaComponents.badge(
                      size: BadgeSize.dot,
                      variant: BadgeVariant.danger,
                      style: BadgeStyle.normal,
                    ),
                  ],
                ),
              ),
              _buildFeatureItem(
                title: 'Positioning',
                description:
                    'Place badges anywhere relative to parent elements',
                badge: OsmeaComponents.badge(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.notifications,
                        size: 24, color: Colors.black54),
                  ),
                  content: '8',
                  position: BadgePosition.topRight,
                  variant: BadgeVariant.danger,
                  style: BadgeStyle.normal,
                  size: BadgeSize.extraSmall,
                ),
              ),
              _buildFeatureItem(
                title: 'Icon Badges',
                description: 'Support for both icon-only and icon+text badges',
                badge: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OsmeaComponents.badge(
                      content: '3',
                      variant: BadgeVariant.primary,
                      style: BadgeStyle.normal,
                      child: const Icon(Icons.mail,
                          size: 22, color: Color.fromARGB(137, 255, 0, 0)),
                    ),
                    const SizedBox(width: 12),
                    OsmeaComponents.badge(
                      content: null,
                      size: BadgeSize.dot,
                      variant: BadgeVariant.warning,
                      style: BadgeStyle.normal,
                      child: const Icon(Icons.chat,
                          size: 22, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
    required Widget badge,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > 600
          ? 250
          : (MediaQuery.of(context).size.width - 60) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            alignment: Alignment.centerLeft,
            child: badge,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.4,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            OsmeaColors.nordicBlue.withValues(alpha: 0.05),
            OsmeaColors.crystalBay.withValues(alpha: 0.08),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(13), // Match badge radius
        border: Border.all(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.08),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 20,
            decoration: BoxDecoration(
              color: OsmeaColors.nordicBlue,
              borderRadius: BorderRadius.circular(13), // Match badge radius
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: OsmeaColors.nordicBlue,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVariantShowcase() {
    return Wrap(
      spacing: 16,
      runSpacing: 24,
      alignment: WrapAlignment.start,
      children: [
        _buildBadgeWithLabel(
            'Soft',
            OsmeaComponents.badge(
              content: 'Soft',
              variant: BadgeVariant.primary,
              shape: BadgeShape.pill,
              style: BadgeStyle.soft,
            )),
        _buildBadgeWithLabel(
            'Normal',
            OsmeaComponents.badge(
              content: 'Normal',
              variant: BadgeVariant.primary,
              shape: BadgeShape.pill,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Outlined',
            OsmeaComponents.badge(
              content: 'Outlined',
              variant: BadgeVariant.primary,
              shape: BadgeShape.pill,
              style: BadgeStyle.outlined,
            )),
        _buildBadgeWithLabel(
            'Ghost',
            OsmeaComponents.badge(
              content: 'Ghost',
              variant: BadgeVariant.primary,
              shape: BadgeShape.pill,
              style: BadgeStyle.ghost,
            )),
        _buildBadgeWithLabel(
            'Success',
            OsmeaComponents.badge(
              content: 'Success',
              variant: BadgeVariant.success,
              shape: BadgeShape.pill,
              style: BadgeStyle.soft,
            )),
        _buildBadgeWithLabel(
            'Warning',
            OsmeaComponents.badge(
              content: 'Warning',
              variant: BadgeVariant.warning,
              shape: BadgeShape.pill,
              style: BadgeStyle.soft,
            )),
        _buildBadgeWithLabel(
            'Danger',
            OsmeaComponents.badge(
              content: 'Danger',
              variant: BadgeVariant.danger,
              shape: BadgeShape.pill,
              style: BadgeStyle.soft,
            )),
        _buildBadgeWithLabel(
            'Info',
            OsmeaComponents.badge(
              content: 'Info',
              variant: BadgeVariant.info,
              shape: BadgeShape.pill,
              style: BadgeStyle.soft,
            )),
      ],
    );
  }

  Widget _buildSizeShowcase() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBadgeWithLabel(
            'Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'XS',
            OsmeaComponents.badge(
              content: '1',
              size: BadgeSize.extraSmall,
              variant: BadgeVariant.primary,
              shape: BadgeShape.circular,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Small',
            OsmeaComponents.badge(
              content: '12',
              size: BadgeSize.small,
              variant: BadgeVariant.success,
              shape: BadgeShape.rounded,
            )),
        _buildBadgeWithLabel(
            'Medium',
            OsmeaComponents.badge(
              content: '42',
              size: BadgeSize.medium,
              variant: BadgeVariant.info,
              shape: BadgeShape.pill,
            )),
        _buildBadgeWithLabel(
            'Large',
            OsmeaComponents.badge(
              content: '87',
              size: BadgeSize.large,
              variant: BadgeVariant.warning,
              shape: BadgeShape.pill,
            )),
        _buildBadgeWithLabel(
            'XL',
            OsmeaComponents.badge(
              content: '100+',
              size: BadgeSize.extraLarge,
              variant: BadgeVariant.danger,
              shape: BadgeShape.rounded,
            )),
      ],
    );
  }

  Widget _buildShapeShowcase() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBadgeWithLabel(
            'Circular',
            OsmeaComponents.badge(
              content: '8',
              shape: BadgeShape.circular,
              variant: BadgeVariant.primary,
              size: BadgeSize.medium,
            )),
        _buildBadgeWithLabel(
            'Rounded',
            OsmeaComponents.badge(
              content: 'New',
              shape: BadgeShape.rounded,
              variant: BadgeVariant.secondary,
              size: BadgeSize.medium,
            )),
        _buildBadgeWithLabel(
            'Pill',
            OsmeaComponents.badge(
              content: 'Popular',
              shape: BadgeShape.pill,
              variant: BadgeVariant.success,
              size: BadgeSize.medium,
            )),
        _buildBadgeWithLabel(
            'Square',
            OsmeaComponents.badge(
              content: '10',
              shape: BadgeShape.square,
              variant: BadgeVariant.info,
              size: BadgeSize.medium,
            )),
        _buildBadgeWithLabel(
            'Rectangle',
            OsmeaComponents.badge(
              content: 'Status',
              shape: BadgeShape.rectangle,
              variant: BadgeVariant.warning,
              size: BadgeSize.medium,
            )),
      ],
    );
  }

  Widget _buildStateShowcase() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBadgeWithLabel(
            'Enabled',
            OsmeaComponents.badge(
              content: 'Enabled',
              state: BadgeState.enabled,
              variant: BadgeVariant.primary,
              shape: BadgeShape.rounded,
            )),
        _buildBadgeWithLabel(
            'Disabled',
            OsmeaComponents.badge(
              content: 'Disabled',
              state: BadgeState.disabled,
              variant: BadgeVariant.primary,
              shape: BadgeShape.rounded,
            )),
        _buildBadgeWithLabel(
            'Active',
            OsmeaComponents.badge(
              content: 'Active',
              state: BadgeState.active,
              variant: BadgeVariant.primary,
              shape: BadgeShape.rounded,
              style: BadgeStyle.normal, // Use normal style for better contrast
              textColor: Colors.white, // Ensure text is white for visibility
            )),
        _buildBadgeWithLabel(
            'Clickable',
            OsmeaComponents.badge(
              content: 'Click me',
              state: BadgeState.clickable,
              variant: BadgeVariant.primary,
              shape: BadgeShape.rounded,
              onTap: () {},
            )),
      ],
    );
  }

  Widget _buildIconShowcase() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBadgeWithLabel(
            'Icon Badge',
            OsmeaComponents.badge(
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.notifications,
                    size: 24, color: Colors.black54),
              ),
              content: '8',
              position: BadgePosition.topRight,
              variant: BadgeVariant.danger,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
            'Avatar Badge',
            OsmeaComponents.badge(
              child: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              content: '3',
              position: BadgePosition.bottomRight,
              variant: BadgeVariant.success,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
            'Icon Only',
            OsmeaComponents.badge(
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.mail, size: 24, color: Colors.black54),
              ),
              content: null,
              position: BadgePosition.topRight,
              style: BadgeStyle.normal,
              size: BadgeSize.dot,
              variant: BadgeVariant.primary,
            )),
        _buildBadgeWithLabel(
            'Button Badge',
            OsmeaComponents.badge(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: OsmeaColors.white,
                  foregroundColor: OsmeaColors.nordicBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Messages'),
              ),
              content: '12',
              position: BadgePosition.topRight,
              variant: BadgeVariant.warning,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
          'Icon + Text',
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OsmeaComponents.badge(
                content: 'Inbox',
                variant: BadgeVariant.primary,
                style: BadgeStyle.soft,
                shape: BadgeShape.pill,
                padding: const EdgeInsets.only(left: 4, right: 10),
                child: const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.mail, size: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        _buildBadgeWithLabel(
          'Notification',
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OsmeaComponents.badge(
                content: '8 New',
                variant: BadgeVariant.danger,
                style: BadgeStyle.normal,
                shape: BadgeShape.pill,
                padding: const EdgeInsets.only(left: 4, right: 10),
                child: const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.notifications,
                      size: 16, color: OsmeaColors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPositionShowcase() {
    final Widget box = Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Text(
          'Parent',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
    );

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        _buildBadgeWithLabel(
            'Top Right',
            OsmeaComponents.badge(
              child: box,
              content: 'TR',
              position: BadgePosition.topRight,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
            'Top Left',
            OsmeaComponents.badge(
              child: box,
              content: 'TL',
              position: BadgePosition.topLeft,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
            'Bottom Right',
            OsmeaComponents.badge(
              child: box,
              content: 'BR',
              position: BadgePosition.bottomRight,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
            'Bottom Left',
            OsmeaComponents.badge(
              child: box,
              content: 'BL',
              position: BadgePosition.bottomLeft,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
        _buildBadgeWithLabel(
            'Center',
            OsmeaComponents.badge(
              child: box,
              content: 'C',
              position: BadgePosition.center,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
              size: BadgeSize.extraSmall,
            )),
      ],
    );
  }

  Widget _buildInteractiveShowcase() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildBadgeWithLabel(
            'Tap Badge',
            OsmeaComponents.badge(
              content: 'Tap me',
              variant: BadgeVariant.primary,
              shape: BadgeShape.pill,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Badge tapped!')),
                );
              },
            )),
        _buildBadgeWithLabel(
            'Max Count',
            OsmeaComponents.badge(
              content: 1250,
              maxCount: 999,
              variant: BadgeVariant.primary,
            )),
        _buildBadgeWithLabel(
            'Zero Count',
            OsmeaComponents.badge(
              content: 0,
              showZero: true,
              variant: BadgeVariant.neutral,
            )),
      ],
    );
  }

  Widget _buildDotBadgeShowcase() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBadgeWithLabel(
            'Primary Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Success Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.success,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Warning Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.warning,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Danger Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.danger,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Info Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.info,
              style: BadgeStyle.normal,
            )),
        _buildBadgeWithLabel(
            'Neutral Dot',
            OsmeaComponents.badge(
              size: BadgeSize.dot,
              variant: BadgeVariant.neutral,
              style: BadgeStyle.normal,
            )),
      ],
    );
  }

  Widget _buildStyleShowcase() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildBadgeWithLabel(
            'Normal Style',
            OsmeaComponents.badge(
              content: 'Normal',
              variant: BadgeVariant.primary,
              style: BadgeStyle.normal,
              shape: BadgeShape.pill,
            )),
        _buildBadgeWithLabel(
            'Soft Style',
            OsmeaComponents.badge(
              content: 'Soft',
              variant: BadgeVariant.primary,
              style: BadgeStyle.soft,
              shape: BadgeShape.pill,
            )),
        _buildBadgeWithLabel(
            'Outlined Style',
            OsmeaComponents.badge(
              content: 'Outlined',
              variant: BadgeVariant.primary,
              style: BadgeStyle.outlined,
              shape: BadgeShape.pill,
            )),
        _buildBadgeWithLabel(
            'Ghost Style',
            OsmeaComponents.badge(
              content: 'Ghost',
              variant: BadgeVariant.primary,
              style: BadgeStyle.ghost,
              shape: BadgeShape.pill,
            )),
        _buildBadgeWithLabel(
            'Mixed Style',
            OsmeaComponents.badge(
              content: 'Mixed',
              variant: BadgeVariant.primary,
              style: BadgeStyle.mixed,
              shape: BadgeShape.pill,
            )),
      ],
    );
  }

  Widget _buildBadgeWithLabel(String label, Widget badge) {
    return Container(
      width: 120, // Fixed width for consistent card sizes
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: OsmeaColors.white,
        borderRadius:
            BorderRadius.circular(13), // Match badge radius for consistency
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: OsmeaColors.nordicBlue.withValues(alpha: 0.08),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60, // Slightly shorter for a cleaner look
            alignment: Alignment.center, // Center badge
            child: badge,
          ),
          const SizedBox(height: 14),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: OsmeaColors.slate.withValues(
                  alpha: 0.9), // More consistent with OSMEA color palette
              letterSpacing: -0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
