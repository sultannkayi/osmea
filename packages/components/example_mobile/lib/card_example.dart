import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/enums/components_enum.dart';

/// 🃏 **OSMEA Card Examples**
///
/// Comprehensive examples demonstrating all variants, sizes, and features
/// of the OSMEA Card component library.
///
/// This file showcases:
/// * 🎨 All card variants (elevated, outlined, filled)
/// * 📏 All size options (small, medium, large)
/// * 📝 Basic Cards - Simple content cards
/// * 🖼️ Image Cards - Cards with image content
/// * 🔘 Action Cards - Cards with interactive elements
/// * 🎯 Custom styling and theming options
/// * 🔧 Full-width and responsive layouts

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text(
          '🃏 OSMEA Card Examples',
          variant: OsmeaTextVariant.headlineMedium,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('📝 Basic Cards'),
            _buildBasicCardsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🖼️ Image Cards'),
            _buildImageCardsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🔘 Action Cards'),
            _buildActionCardsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🎨 Card Variants'),
            _buildVariantsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('📏 Card Sizes'),
            _buildSizesSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🎭 Interactive Examples'),
            _buildInteractiveSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🚀 Advanced Examples'),
            _buildAdvancedSection(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return OsmeaComponents.text(
      title,
      variant: OsmeaTextVariant.headlineSmall,
      color: OsmeaColors.nordicBlue,
    );
  }

  Widget _buildSubsectionTitle(String title) {
    return OsmeaComponents.text(
      title,
      variant: OsmeaTextVariant.titleMedium,
      color: OsmeaColors.pewter,
    );
  }

  Widget _buildBasicCardsSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Simple Basic Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Welcome to OSMEA',
          subtitle: 'Component Library',
          content:
              'A comprehensive Flutter component library with beautiful, accessible, and customizable components.',
          variant: ComponentAppearance.elevated,
          size: ComponentSize.medium,
          onTap: () => _showSnackBar('Basic card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Card with Custom Styling'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Premium Feature',
          subtitle: 'Pro Plan',
          content:
              'Unlock advanced features with our premium plan. Get access to exclusive components and priority support.',
          variant: ComponentAppearance.outlined,
          size: ComponentSize.medium,
          titleColor: OsmeaColors.nordicBlue,
          subtitleColor: OsmeaColors.sunsetGlow,
          contentColor: OsmeaColors.pewter,
          onTap: () => _showSnackBar('Premium card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Card with Custom Content'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          variant: ComponentAppearance.filled,
          size: ComponentSize.large,
          customContent: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 32),
                  OsmeaComponents.sizedBox(width: 12),
                  OsmeaComponents.column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OsmeaComponents.text(
                        'Featured Component',
                        variant: OsmeaTextVariant.titleMedium,
                        color: OsmeaColors.nordicBlue,
                      ),
                      OsmeaComponents.text(
                        'Highly recommended',
                        variant: OsmeaTextVariant.labelMedium,
                        color: OsmeaColors.forestHeart,
                      ),
                    ],
                  ),
                ],
              ),
              OsmeaComponents.sizedBox(height: 16),
              OsmeaComponents.text(
                'This card demonstrates how to use custom content with the OSMEA card component.',
                variant: OsmeaTextVariant.bodyMedium,
              ),
            ],
          ),
          onTap: () => _showSnackBar('Custom content card tapped'),
        ),
      ],
    );
  }

  Widget _buildImageCardsSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Image Card - Top Position'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.imageCard(
          title: 'Beautiful Nature',
          subtitle: 'Photography Collection',
          content:
              'Discover stunning landscape photography from around the world.',
          imageAsset: 'assets/placeholder_image.png', // Placeholder for demo
          imageHeight: 200,
          imagePosition: ComponentPosition.top,
          variant: ComponentAppearance.elevated,
          size: ComponentSize.medium,
          onTap: () => _showSnackBar('Nature image card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Image Card - Left Position'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.imageCard(
          title: 'Tech Innovation',
          subtitle: 'Latest Updates',
          content:
              'Stay updated with the latest technology trends and innovations.',
          imageWidget: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [OsmeaColors.nordicBlue, OsmeaColors.crystalBay],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.computer, color: Colors.white, size: 32),
          ),
          imagePosition: ComponentPosition.left,
          variant: ComponentAppearance.outlined,
          size: ComponentSize.medium,
          onTap: () => _showSnackBar('Tech image card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Image Card with Badge'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.imageCard(
          title: 'New Product Launch',
          subtitle: 'Limited Edition',
          content:
              'Get your hands on our newest product with exclusive features.',
          imageWidget: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [OsmeaColors.sunsetGlow, OsmeaColors.goldenHour],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                const Icon(Icons.shopping_bag, color: Colors.white, size: 48),
          ),
          badge: OsmeaComponents.badge(
            content: 'NEW',
            variant: BadgeVariant.danger,
            size: BadgeSize.small,
          ),
          badgePosition: BadgePosition.topRight,
          variant: ComponentAppearance.elevated,
          size: ComponentSize.medium,
          onTap: () => _showSnackBar('Product launch card tapped'),
        ),
      ],
    );
  }

  Widget _buildActionCardsSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Confirmation Dialog Card'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.actionCard(
          title: 'Delete Account',
          subtitle: 'This action cannot be undone',
          content:
              'Are you sure you want to permanently delete your account? All your data will be lost.',
          primaryAction: 'Delete',
          secondaryAction: 'Cancel',
          onPrimaryPressed: () => _showSnackBar('Delete confirmed'),
          onSecondaryPressed: () => _showSnackBar('Delete cancelled'),
          primaryVariant: ButtonVariant.danger,
          secondaryVariant: ButtonVariant.outlined,
          variant: ComponentAppearance.elevated,
          size: ComponentSize.medium,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Subscription Card'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.actionCard(
          title: 'Upgrade to Pro',
          subtitle: '\$9.99/month',
          content:
              'Get access to premium features, priority support, and exclusive content.',
          primaryAction: 'Subscribe Now',
          secondaryAction: 'Learn More',
          onPrimaryPressed: () => _showSnackBar('Subscription started'),
          onSecondaryPressed: () => _showSnackBar('Learn more tapped'),
          primaryVariant: ButtonVariant.primary,
          secondaryVariant: ButtonVariant.outlined,
          primaryIcon: const Icon(Icons.star, size: 18),
          secondaryIcon: const Icon(Icons.info_outline, size: 18),
          variant: ComponentAppearance.filled,
          size: ComponentSize.medium,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Vertical Button Layout'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.actionCard(
          title: 'Save Changes',
          content:
              'You have unsaved changes. Would you like to save them before leaving?',
          primaryAction: 'Save & Exit',
          secondaryAction: 'Discard Changes',
          onPrimaryPressed: () => _showSnackBar('Changes saved'),
          onSecondaryPressed: () => _showSnackBar('Changes discarded'),
          primaryVariant: ButtonVariant.primary,
          secondaryVariant: ButtonVariant.outlined,
          buttonLayout: ComponentOrientation.vertical,
          variant: ComponentAppearance.elevated,
          size: ComponentSize.medium,
        ),
      ],
    );
  }

  Widget _buildVariantsSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Elevated Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            OsmeaComponents.basicCard(
              title: 'Elevated Card',
              content: 'This card has shadow elevation for depth.',
              variant: ComponentAppearance.elevated,
              size: ComponentSize.medium,
              width: 200,
              onTap: () => _showSnackBar('Elevated card tapped'),
            ),
          ],
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Outlined Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            OsmeaComponents.basicCard(
              title: 'Outlined Card',
              content: 'This card has a border outline.',
              variant: ComponentAppearance.outlined,
              size: ComponentSize.extraSmall,
              onTap: () => _showSnackBar('Outlined card tapped'),
            ),
          ],
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Filled Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            OsmeaComponents.basicCard(
              title: 'Filled Card',
              content: 'This card has a filled background.',
              variant: ComponentAppearance.filled,
              size: ComponentSize.medium,
              width: 200,
              onTap: () => _showSnackBar('Filled card tapped'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizesSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Small Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Small Card',
          content: 'Compact card with minimal content.',
          variant: ComponentAppearance.elevated,
          size: ComponentSize.small,
          onTap: () => _showSnackBar('Small card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Medium Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Medium Card',
          subtitle: 'Standard Size',
          content: 'This is a medium-sized card with standard proportions.',
          variant: ComponentAppearance.elevated,
          size: ComponentSize.medium,
          onTap: () => _showSnackBar('Medium card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Large Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Large Card',
          subtitle: 'Extra Space',
          content:
              'This is a large card with plenty of space for content. It\'s perfect for detailed information and rich content.',
          variant: ComponentAppearance.elevated,
          size: ComponentSize.large,
          onTap: () => _showSnackBar('Large card tapped'),
        ),
      ],
    );
  }

  Widget _buildInteractiveSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Clickable Cards'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Interactive Card',
          subtitle: 'Tap to interact',
          content: 'This card responds to tap events with visual feedback.',
          variant: ComponentAppearance.outlined,
          size: ComponentSize.medium,
          onTap: () => _showSnackBar('Interactive card tapped'),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Cards with Custom Actions'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          title: 'Notification Settings',
          content: 'Manage your notification preferences.',
          variant: ComponentAppearance.filled,
          size: ComponentSize.medium,
          customContent: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.text(
                'Notification Settings',
                variant: OsmeaTextVariant.titleMedium,
                color: OsmeaColors.nordicBlue,
              ),
              OsmeaComponents.sizedBox(height: 8),
              OsmeaComponents.text(
                'Manage your notification preferences.',
                variant: OsmeaTextVariant.bodyMedium,
              ),
              OsmeaComponents.sizedBox(height: 16),
              OsmeaComponents.row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OsmeaComponents.text('Push Notifications'),
                  Switch(
                    value: true,
                    onChanged: (value) => _showSnackBar(
                        'Push notifications ${value ? 'enabled' : 'disabled'}'),
                  ),
                ],
              ),
              OsmeaComponents.sizedBox(height: 8),
              OsmeaComponents.row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OsmeaComponents.text('Email Notifications'),
                  Switch(
                    value: false,
                    onChanged: (value) => _showSnackBar(
                        'Email notifications ${value ? 'enabled' : 'disabled'}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedSection() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubsectionTitle('Card Grid Layout'),
        OsmeaComponents.sizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            OsmeaComponents.basicCard(
              title: 'Stats',
              content: '1,234 Users',
              variant: ComponentAppearance.elevated,
              size: ComponentSize.small,
              onTap: () => _showSnackBar('Stats card tapped'),
            ),
            OsmeaComponents.basicCard(
              title: 'Revenue',
              content: '\$12,345',
              variant: ComponentAppearance.elevated,
              size: ComponentSize.small,
              onTap: () => _showSnackBar('Revenue card tapped'),
            ),
            OsmeaComponents.basicCard(
              title: 'Growth',
              content: '+23.4%',
              variant: ComponentAppearance.elevated,
              size: ComponentSize.small,
              onTap: () => _showSnackBar('Growth card tapped'),
            ),
            OsmeaComponents.basicCard(
              title: 'Orders',
              content: '567 Orders',
              variant: ComponentAppearance.elevated,
              size: ComponentSize.small,
              onTap: () => _showSnackBar('Orders card tapped'),
            ),
          ],
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildSubsectionTitle('Profile Card Example'),
        OsmeaComponents.sizedBox(height: 16),
        OsmeaComponents.basicCard(
          variant: ComponentAppearance.elevated,
          size: ComponentSize.large,
          customContent: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: OsmeaColors.nordicBlue,
                    child:
                        const Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  OsmeaComponents.sizedBox(width: 16),
                  OsmeaComponents.expanded(
                    child: OsmeaComponents.column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OsmeaComponents.text(
                          'John Doe',
                          variant: OsmeaTextVariant.titleLarge,
                          color: OsmeaColors.nordicBlue,
                        ),
                        OsmeaComponents.text(
                          'Senior Developer',
                          variant: OsmeaTextVariant.bodyMedium,
                          color: OsmeaColors.pewter,
                        ),
                        OsmeaComponents.text(
                          'San Francisco, CA',
                          variant: OsmeaTextVariant.labelMedium,
                          color: OsmeaColors.steel,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              OsmeaComponents.sizedBox(height: 16),
              const Divider(),
              OsmeaComponents.sizedBox(height: 16),
              OsmeaComponents.row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OsmeaComponents.column(
                    children: [
                      OsmeaComponents.text(
                        '156',
                        variant: OsmeaTextVariant.titleMedium,
                        color: OsmeaColors.nordicBlue,
                      ),
                      OsmeaComponents.text(
                        'Projects',
                        variant: OsmeaTextVariant.labelMedium,
                        color: OsmeaColors.pewter,
                      ),
                    ],
                  ),
                  OsmeaComponents.column(
                    children: [
                      OsmeaComponents.text(
                        '89',
                        variant: OsmeaTextVariant.titleMedium,
                        color: OsmeaColors.forestHeart,
                      ),
                      OsmeaComponents.text(
                        'Completed',
                        variant: OsmeaTextVariant.labelMedium,
                        color: OsmeaColors.pewter,
                      ),
                    ],
                  ),
                  OsmeaComponents.column(
                    children: [
                      OsmeaComponents.text(
                        '4.9',
                        variant: OsmeaTextVariant.titleMedium,
                        color: OsmeaColors.sunsetGlow,
                      ),
                      OsmeaComponents.text(
                        'Rating',
                        variant: OsmeaTextVariant.labelMedium,
                        color: OsmeaColors.pewter,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          onTap: () => _showSnackBar('Profile card tapped'),
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: OsmeaComponents.text(message),
        backgroundColor: OsmeaColors.nordicBlue,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
