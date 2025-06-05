import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';
import 'buttons.dart';
import 'tag.dart';
import 'badge.dart';

class OsmeaProductDetailCard extends StatelessWidget {
  final String imageUrl;
  final List<String>? additionalImages;
  final String title;
  final String? subtitle;
  final double price;
  final String? discountPrice;
  final String? badge;
  final List<String>? tags;
  final String? description;
  final Map<String, String>? attributes;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;
  final ThemeType themeType;
  final bool showRating;
  final double? rating;
  final int? reviewCount;
  final bool expanded;
  final VoidCallback? onTap;

  const OsmeaProductDetailCard({
    Key? key,
    required this.imageUrl,
    this.additionalImages,
    required this.title,
    this.subtitle,
    required this.price,
    this.discountPrice,
    this.badge,
    this.tags,
    this.description,
    this.attributes,
    this.onAddToCart,
    this.onFavorite,
    this.onShare,
    required this.themeType,
    this.showRating = false,
    this.rating,
    this.reviewCount,
    this.expanded = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: OsmeaColors.surface(themeType),
          borderRadius: BorderRadius.circular(13), // Match button radius
          border: Border.all(
            color: OsmeaColors.border(themeType),
            width: 0.5, // Match button stroke
          ),
          boxShadow: expanded
              ? [
                  BoxShadow(
                    color: Colors.black
                        .withAlpha(13), // Changed from withOpacity(0.05)
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            Padding(
              padding: EdgeInsets.all(ComponentDimensions.spaceM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Favorite Button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (subtitle != null) ...[
                              Text(
                                subtitle!,
                                style: OsmeaTypography.bodySmall(themeType)
                                    .copyWith(
                                  color: OsmeaColors.textSecondary(themeType),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                            ],
                            Text(
                              title,
                              style: OsmeaTypography.h5(themeType),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      if (onFavorite != null)
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: onFavorite,
                          color: OsmeaColors.textSecondary(themeType),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          iconSize: 24,
                        ),
                    ],
                  ),

                  SizedBox(height: ComponentDimensions.spaceS),

                  // Rating
                  if (showRating && rating != null) _buildRatingSection(),

                  // Tags
                  if (tags != null && tags!.isNotEmpty) ...[
                    SizedBox(height: ComponentDimensions.spaceS),
                    _buildTagsSection(),
                  ],

                  SizedBox(height: ComponentDimensions.spaceS),

                  // Price
                  _buildPriceSection(),

                  // Description
                  if (description != null && expanded) ...[
                    SizedBox(height: ComponentDimensions.spaceM),
                    Text(
                      description!,
                      style: OsmeaTypography.bodyMedium(themeType),
                      maxLines: expanded ? 5 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  // Attributes
                  if (attributes != null &&
                      attributes!.isNotEmpty &&
                      expanded) ...[
                    SizedBox(height: ComponentDimensions.spaceM),
                    _buildAttributesSection(),
                  ],

                  // Action Buttons
                  if (expanded) ...[
                    SizedBox(height: ComponentDimensions.spaceM),
                    _buildActionButtons(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        // Main Image
        AspectRatio(
          aspectRatio: expanded ? 16 / 9 : 1,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(13), // Match container radius
              topRight: Radius.circular(13), // Match container radius
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: OsmeaColors.secondary
                      .withAlpha(26), // Changed from withOpacity(0.1)
                  child: Icon(
                    Icons.image,
                    color: OsmeaColors.textSecondary(themeType),
                    size: 40,
                  ),
                );
              },
            ),
          ),
        ),

        // Badge
        if (badge != null)
          Positioned(
            top: ComponentDimensions.spaceS,
            left: ComponentDimensions.spaceS,
            child: OsmeaBadge(
              label: badge!,
              variant: OsmeaBadgeVariant.primary,
              themeType: themeType,
            ),
          ),

        // Discount Badge
        if (discountPrice != null)
          Positioned(
            top: ComponentDimensions.spaceS,
            right: ComponentDimensions.spaceS,
            child: OsmeaBadge(
              label: 'SALE',
              variant: OsmeaBadgeVariant.danger,
              themeType: themeType,
            ),
          ),

        // Additional Image Indicators
        if (additionalImages != null &&
            additionalImages!.isNotEmpty &&
            expanded)
          Positioned(
            bottom: ComponentDimensions.spaceS,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                additionalImages!.length + 1, // +1 for main image
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? OsmeaColors.primary
                        : OsmeaColors.surface(themeType),
                    border: Border.all(
                      color: OsmeaColors.border(themeType),
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRatingSection() {
    const starCount = 5;
    final filledStars = (rating! * (starCount / 5)).round();

    return Row(
      children: [
        ...List.generate(
          starCount,
          (index) => Icon(
            index < filledStars ? Icons.star : Icons.star_border,
            color: OsmeaColors.warning,
            size: 16,
          ),
        ),
        SizedBox(width: ComponentDimensions.spaceXS),
        if (reviewCount != null)
          Text(
            '($reviewCount)',
            style: OsmeaTypography.bodySmall(themeType).copyWith(
              color: OsmeaColors.textSecondary(themeType),
            ),
          ),
      ],
    );
  }

  Widget _buildTagsSection() {
    return Wrap(
      spacing: ComponentDimensions.spaceXXS,
      runSpacing: ComponentDimensions.spaceXXS,
      children: tags!.map((tag) {
        return OsmeaTag(
          label: tag,
          themeType: themeType,
        );
      }).toList(),
    );
  }

  Widget _buildPriceSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Current Price
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: OsmeaTypography.h6(themeType).copyWith(
            color: discountPrice != null
                ? OsmeaColors.error
                : OsmeaColors.onSurface(themeType),
            fontWeight: FontWeight.w600,
          ),
        ),

        // Original Price (if discounted)
        if (discountPrice != null) ...[
          SizedBox(width: ComponentDimensions.spaceXS),
          Text(
            '\$$discountPrice',
            style: OsmeaTypography.bodyMedium(themeType).copyWith(
              decoration: TextDecoration.lineThrough,
              color: OsmeaColors.textSecondary(themeType),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAttributesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specifications',
          style: OsmeaTypography.bodyLarge(themeType).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: ComponentDimensions.spaceXS),
        ...attributes!.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${entry.key}: ',
                  style: OsmeaTypography.bodyMedium(themeType).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    entry.value,
                    style: OsmeaTypography.bodyMedium(themeType),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        if (onAddToCart != null)
          Expanded(
            child: OsmeaButton(
              label: 'Add to Cart',
              variant: OsmeaButtonVariant.primary,
              icon: Icons.shopping_cart,
              themeType: themeType,
              onPressed: onAddToCart,
            ),
          ),
        if (onShare != null) ...[
          SizedBox(width: ComponentDimensions.spaceS),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: onShare,
            color: OsmeaColors.onSurface(themeType),
          ),
        ],
      ],
    );
  }
}
