import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';
import 'product_detail_card.dart';
import 'skeleton_loader.dart';

enum OsmeaProductListViewType { grid, list, compact }

class OsmeaProductListView extends StatelessWidget {
  final List<dynamic> products;
  final OsmeaProductListViewType viewType;
  final Function(dynamic) onProductTap;
  final bool isLoading;
  final String? emptyStateTitle;
  final String? emptyStateMessage;
  final IconData? emptyStateIcon;
  final VoidCallback? emptyStateAction;
  final String? emptyStateActionLabel;
  final ThemeType themeType;
  final int gridCrossAxisCount;
  final double gridChildAspectRatio;

  const OsmeaProductListView({
    Key? key,
    required this.products,
    required this.onProductTap,
    required this.themeType,
    this.viewType = OsmeaProductListViewType.grid,
    this.isLoading = false,
    this.emptyStateTitle,
    this.emptyStateMessage,
    this.emptyStateIcon,
    this.emptyStateAction,
    this.emptyStateActionLabel,
    this.gridCrossAxisCount = 2,
    this.gridChildAspectRatio = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingState();
    }

    if (products.isEmpty) {
      return _buildEmptyState();
    }

    switch (viewType) {
      case OsmeaProductListViewType.grid:
        return _buildGridView();
      case OsmeaProductListViewType.list:
        return _buildListView();
      case OsmeaProductListViewType.compact:
        return _buildCompactView();
      default:
        return _buildGridView();
    }
  }

  Widget _buildLoadingState() {
    switch (viewType) {
      case OsmeaProductListViewType.grid:
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCrossAxisCount,
            childAspectRatio: gridChildAspectRatio,
            crossAxisSpacing: ComponentDimensions.spaceS,
            mainAxisSpacing: ComponentDimensions.spaceS,
          ),
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(ComponentDimensions.spaceS),
          itemBuilder: (context, index) {
            return OsmeaSkeletonLoaders.productCard(themeType);
          },
        );
      case OsmeaProductListViewType.list:
      case OsmeaProductListViewType.compact:
        return ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(ComponentDimensions.spaceS),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: ComponentDimensions.spaceS),
              child: OsmeaSkeletonLoaders.productCard(themeType),
            );
          },
        );
      default:
        return OsmeaSkeletonLoaders.productCard(themeType);
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(ComponentDimensions.spaceL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              emptyStateIcon ?? Icons.shopping_basket_outlined,
              size: 64,
              color: OsmeaColors.textSecondary(themeType),
            ),
            SizedBox(height: ComponentDimensions.spaceM),
            Text(
              emptyStateTitle ?? 'No Products Found',
              style: OsmeaTypography.h5(themeType),
              textAlign: TextAlign.center,
            ),
            if (emptyStateMessage != null) ...[
              SizedBox(height: ComponentDimensions.spaceS),
              Text(
                emptyStateMessage!,
                style: OsmeaTypography.bodyMedium(themeType).copyWith(
                  color: OsmeaColors.textSecondary(themeType),
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (emptyStateAction != null && emptyStateActionLabel != null) ...[
              SizedBox(height: ComponentDimensions.spaceL),
              TextButton(
                onPressed: emptyStateAction,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    OsmeaColors.primary,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                      horizontal: ComponentDimensions.spaceM,
                      vertical: ComponentDimensions.spaceS,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ComponentDimensions.radiusS),
                    ),
                  ),
                ),
                child: Text(
                  emptyStateActionLabel!,
                  style: OsmeaTypography.bodyMedium(themeType).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCrossAxisCount,
        childAspectRatio: gridChildAspectRatio,
        crossAxisSpacing: ComponentDimensions.spaceS,
        mainAxisSpacing: ComponentDimensions.spaceS,
      ),
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => onProductTap(product),
          child: OsmeaProductDetailCard(
            imageUrl: product.imageUrl,
            title: product.title,
            subtitle: product.subtitle,
            price: product.price,
            discountPrice: product.discountPrice,
            badge: product.discountPrice != null ? 'SALE' : null,
            themeType: themeType,
            showRating: true,
            rating: product.rating,
            reviewCount: product.reviewCount,
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      itemBuilder: (context, index) {
        final product = products[index];
        return Padding(
          padding: EdgeInsets.only(bottom: ComponentDimensions.spaceS),
          child: GestureDetector(
            onTap: () => onProductTap(product),
            child: OsmeaProductDetailCard(
              imageUrl: product.imageUrl,
              title: product.title,
              subtitle: product.subtitle,
              price: product.price,
              discountPrice: product.discountPrice,
              badge: product.discountPrice != null ? 'SALE' : null,
              themeType: themeType,
              showRating: true,
              rating: product.rating,
              reviewCount: product.reviewCount,
              expanded: true,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCompactView() {
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: EdgeInsets.only(bottom: ComponentDimensions.spaceXS),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ComponentDimensions.radiusS),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(ComponentDimensions.spaceS),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(ComponentDimensions.radiusXS),
              child: Image.network(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product.title,
              style: OsmeaTypography.bodyMedium(themeType).copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.subtitle,
                  style: OsmeaTypography.bodySmall(themeType).copyWith(
                    color: OsmeaColors.textSecondary(themeType),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: ComponentDimensions.spaceXXS),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: OsmeaTypography.bodyMedium(themeType).copyWith(
                    color: OsmeaColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => onProductTap(product),
          ),
        );
      },
    );
  }
}
