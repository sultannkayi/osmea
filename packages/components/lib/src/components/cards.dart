import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

enum OsmeaCardType { product, user, summary }

class OsmeaCard extends StatelessWidget {
  final OsmeaCardType type;
  final Widget? child;
  final ThemeType themeType;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  const OsmeaCard({
    Key? key,
    required this.type,
    required this.themeType,
    this.child,
    this.padding,
    this.width,
    this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Default padding based on card type
    EdgeInsets defaultPadding;
    switch (type) {
      case OsmeaCardType.product:
        defaultPadding = EdgeInsets.all(ComponentDimensions.spaceS);
        break;
      case OsmeaCardType.user:
        defaultPadding = EdgeInsets.all(ComponentDimensions.spaceS);
        break;
      case OsmeaCardType.summary:
        defaultPadding = EdgeInsets.all(ComponentDimensions.spaceM);
        break;
    }

    return Material(
      color: OsmeaColors.surface(themeType),
      borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
        child: Container(
          width: width,
          height: height,
          padding: padding ?? defaultPadding,
          decoration: BoxDecoration(
            border: Border.all(
              color: OsmeaColors.border(themeType),
              width: ComponentDimensions.borderWidthThin,
            ),
            borderRadius: BorderRadius.circular(ComponentDimensions.radiusM),
          ),
          child: child,
        ),
      ),
    );
  }

  /// Create a card using the design system from context
  factory OsmeaCard.fromContext({
    required BuildContext context,
    required OsmeaCardType type,
    Widget? child,
    EdgeInsets? padding,
    double? width,
    double? height,
    VoidCallback? onTap,
  }) {
    return OsmeaCard(
      type: type,
      themeType: ThemeType.light,
      child: child,
      padding: padding,
      width: width,
      height: height,
      onTap: onTap,
    );
  }
}

class OsmeaProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String? discountPrice;
  final String? badge;
  final ThemeType themeType;
  final VoidCallback? onTap;

  const OsmeaProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.themeType,
    this.discountPrice,
    this.badge,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaCard(
      type: OsmeaCardType.product,
      themeType: themeType,
      onTap: onTap,
      width: 160,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with badge if present
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(ComponentDimensions.radiusM),
                ),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (badge != null)
                Positioned(
                  top: ComponentDimensions.spaceXS,
                  left: ComponentDimensions.spaceXS,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ComponentDimensions.spaceXS,
                      vertical: ComponentDimensions.spaceXXS,
                    ),
                    decoration: BoxDecoration(
                      color: badge == 'Sale'
                          ? OsmeaColors.error
                          : OsmeaColors.primary,
                      borderRadius:
                          BorderRadius.circular(ComponentDimensions.radiusXS),
                    ),
                    child: Text(
                      badge!,
                      style: OsmeaTypography.bodySmall(themeType).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Product details
          Padding(
            padding: EdgeInsets.all(ComponentDimensions.spaceS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: OsmeaTypography.bodyMedium(themeType).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: ComponentDimensions.spaceXS),
                Row(
                  children: [
                    Text(
                      '₺${price.toStringAsFixed(2)}',
                      style: discountPrice != null
                          ? OsmeaTypography.bodySmall(themeType).copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: OsmeaColors.neutral500,
                            )
                          : OsmeaTypography.bodyLarge(themeType).copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                    ),
                    if (discountPrice != null) ...[
                      SizedBox(width: ComponentDimensions.spaceXS),
                      Text(
                        '₺$discountPrice',
                        style: OsmeaTypography.bodyLarge(themeType).copyWith(
                          fontWeight: FontWeight.w600,
                          color: OsmeaColors.error,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Create a product card using the design system from context
  factory OsmeaProductCard.fromContext({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required double price,
    String? discountPrice,
    String? badge,
    VoidCallback? onTap,
  }) {
    return OsmeaProductCard(
      imageUrl: imageUrl,
      title: title,
      price: price,
      themeType: ThemeType.light,
      discountPrice: discountPrice,
      badge: badge,
      onTap: onTap,
    );
  }
}
