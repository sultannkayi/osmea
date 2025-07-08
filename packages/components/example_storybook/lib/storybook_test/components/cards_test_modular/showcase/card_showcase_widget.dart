import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_storybook_example/storybook_test/components/cards_test_modular/utils/card_builder.dart';
import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';

/// 🃏 **Card Showcase Widget**
///
/// Builds a single card that responds to knob changes in real-time.
class CardShowcaseWidget extends StatelessWidget {
  final String cardType;
  final ComponentAppearance variant;
  final ComponentSize size;
  final String titleText;
  final String subtitleText;
  final String contentText;

  // Advanced feature parameters
  final ComponentPosition imagePosition;
  final bool useNetworkImage;
  final bool showOverlay;
  final bool showBadge;
  final BadgePosition badgePosition;
  final double fixedHeight; // 0 means auto

  const CardShowcaseWidget({
    super.key,
    required this.cardType,
    required this.variant,
    required this.size,
    required this.titleText,
    required this.subtitleText,
    required this.contentText,
    required this.imagePosition,
    required this.useNetworkImage,
    required this.showOverlay,
    required this.showBadge,
    required this.badgePosition,
    required this.fixedHeight,
  });

  @override
  Widget build(BuildContext context) {
    final card = _buildCard(context);

    final Map<String, String> infoChips = {
      'Type': cardType,
      'Variant': CardBuilder.enumToString(variant),
      'Size': CardBuilder.enumToString(size),
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeaderSection(
              title: '🃏 OSMEA Card Showcase',
              subtitle: 'Interactive demonstration of Card component',
              infoChips: infoChips,
            ),
            const SizedBox(height: 32),
            SectionContainerWidget(
              title: 'Demo',
              children: [SizedBox(width: 350, child: card)],
              wrapContent: false,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the appropriate card based on [cardType].
  Widget _buildCard(BuildContext context) {
    switch (cardType) {
      case 'Image':
        final imgCard = OsmeaComponents.imageCard(
          title: titleText,
          subtitle: subtitleText,
          content: contentText,
          imageUrl: useNetworkImage ? 'https://picsum.photos/600/300?random' : null,
          imageWidget: useNetworkImage
              ? null
              : Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, color: Colors.white, size: 48),
                  ),
                ),
          imageHeight: 140,
          imagePosition: imagePosition,
          showOverlay: showOverlay,
          badge: showBadge
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: OsmeaColors.sunsetGlow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                )
              : null,
          badgePosition: badgePosition,
          variant: variant,
          size: size,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image card tapped!')),
            );
          },
        );
        return fixedHeight > 0
            ? ConstrainedBox(
                constraints: BoxConstraints(minHeight: fixedHeight),
                child: imgCard,
              )
            : imgCard;

      case 'Action':
        final action = OsmeaComponents.actionCard(
          title: titleText,
          content: contentText,
          primaryAction: 'Confirm',
          secondaryAction: 'Cancel',
          onPrimaryPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Primary pressed')),
            );
          },
          onSecondaryPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Secondary pressed')),
            );
          },
          variant: variant,
          size: size,
        );
        return fixedHeight > 0
            ? ConstrainedBox(
                constraints: BoxConstraints(minHeight: fixedHeight),
                child: action,
              )
            : action;

      default:
        final basic = OsmeaComponents.basicCard(
          title: titleText,
          subtitle: subtitleText,
          content: contentText,
          variant: variant,
          size: size,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Basic card tapped!')),
            );
          },
        );
        return fixedHeight > 0
            ? ConstrainedBox(
                constraints: BoxConstraints(minHeight: fixedHeight),
                child: basic,
              )
            : basic;
    }
  }
} 