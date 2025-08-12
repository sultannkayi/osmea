import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/common_appbar.dart';

/// 🎯 **Mobile-Inspired AppBars Showcase**
///
/// Comprehensive showcase of OSMEA AppBar variants inspired by
/// popular mobile app designs and interfaces.
class AppbarShowcase extends StatelessWidget {
  const AppbarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: const OsmeaComponentsAppBar(
        screenKey: 'appbar_example',
      ),
      body: ListView(
        padding: context.paddingNormal,
        children: [
          OsmeaComponents.text(
            '📱 Mobile App Inspired Designs',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'AppBar designs inspired by popular mobile applications',
            fontSize: 16,
            color: OsmeaColors.grey,
          ),
          OsmeaComponents.sizedBox(height: 32),

          // Osmea Style - Standard Variant
          _buildMobileAppExample(
            context,
            appName: 'Osmea Style (Standard)',
            description:
                'Clean white background with left-aligned content, perfect for reading and content apps',
            preview: _buildOsmeaStyleApp(context),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Social Media Style - Primary Variant
          _buildMobileAppExample(
            context,
            appName: 'Social Media Style (Primary)',
            description:
                'Brand-focused design with strong visual presence, great for social platforms',
            preview: _buildSocialMediaStyleApp(context),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // E-commerce Style - Secondary Variant
          _buildMobileAppExample(
            context,
            appName: 'E-commerce Style (Secondary)',
            description:
                'Subtle and clean design perfect for shopping and marketplace apps',
            preview: _buildEcommerceStyleApp(context),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Productivity Style - Surface Variant
          _buildMobileAppExample(
            context,
            appName: 'Productivity Style (Surface)',
            description:
                'Material design with balanced elevation for productivity and business apps',
            preview: _buildProductivityStyleApp(context),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Entertainment Style - Gradient Variant
          _buildMobileAppExample(
            context,
            appName: 'Entertainment Style (Gradient)',
            description:
                'Vibrant gradient design for media and entertainment applications',
            preview: _buildEntertainmentStyleApp(context),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Minimal Style - Outlined Variant
          _buildMobileAppExample(
            context,
            appName: 'Minimal Style (Outlined)',
            description:
                'Clean and minimal border-only design for focus-driven apps',
            preview: _buildMinimalStyleApp(context),
          ),

          OsmeaComponents.sizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildMobileAppExample(
    BuildContext context, {
    required String appName,
    required String description,
    required Widget preview,
  }) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: OsmeaComponents.container(
        decoration: BoxDecoration(
          color: OsmeaColors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: OsmeaColors.grey[200]!),
        ),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.padding(
              padding: context.paddingNormal,
              child: OsmeaComponents.column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OsmeaComponents.text(
                    appName,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  OsmeaComponents.sizedBox(height: 4),
                  OsmeaComponents.text(
                    description,
                    fontSize: 14,
                    color: OsmeaColors.grey[600],
                  ),
                ],
              ),
            ),
            OsmeaComponents.container(
              decoration: const BoxDecoration(
                color: OsmeaColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: preview,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOsmeaStyleApp(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('Osmea'),
          variant: AppBarVariant.standard,
          size: AppBarSize.comfortable,
          titleAlignment: AppBarTitleAlignment.left,
          leading: OsmeaComponents.iconButton(
            icon: const Icon(Icons.expand_more),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.notification,
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
              badge: _buildNotificationBadge('1', OsmeaColors.green, context),
            ),
          ],
        ),
        _buildAppContent('📚 Your reading list awaits', context),
      ],
    );
  }

  Widget _buildSocialMediaStyleApp(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('SocialHub'),
          variant: AppBarVariant.primary,
          size: AppBarSize.comfortable,
          titleAlignment: AppBarTitleAlignment.center,
          leading: OsmeaComponents.iconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.search,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            AppBarAction(
              type: AppBarActionType.notification,
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
              badge: _buildNotificationBadge('5', OsmeaColors.red, context),
            ),
          ],
        ),
        _buildAppContent('👋 Connect with friends', context),
      ],
    );
  }

  Widget _buildEcommerceStyleApp(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('ShopEase'),
          subtitle: OsmeaComponents.text('Fashion & Lifestyle'),
          variant: AppBarVariant.secondary,
          size: AppBarSize.standard,
          titleAlignment: AppBarTitleAlignment.left,
          leading: OsmeaComponents.iconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.search,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            AppBarAction(
              type: AppBarActionType.favorite,
              icon: const Icon(Icons.favorite_outline),
              onPressed: () {},
            ),
            AppBarAction(
              type: AppBarActionType.more,
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
              badge: _buildNotificationBadge('3', OsmeaColors.orange, context),
            ),
          ],
        ),
        _buildAppContent('🛍️ Discover amazing products', context),
      ],
    );
  }

  Widget _buildProductivityStyleApp(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('TaskMaster'),
          subtitle: OsmeaComponents.text('Project Management'),
          variant: AppBarVariant.surface,
          size: AppBarSize.large,
          titleAlignment: AppBarTitleAlignment.left,
          leading: OsmeaComponents.iconButton(
            icon: const Icon(Icons.dashboard),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.add,
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
            AppBarAction(
              type: AppBarActionType.settings,
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        _buildAppContent('✅ Boost your productivity', context),
      ],
    );
  }

  Widget _buildEntertainmentStyleApp(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('StreamFlix'),
          variant: AppBarVariant.gradient,
          size: AppBarSize.comfortable,
          titleAlignment: AppBarTitleAlignment.center,
          leading: OsmeaComponents.iconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.search,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            AppBarAction(
              type: AppBarActionType.profile,
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
        _buildAppContent('🎬 Endless entertainment', context),
      ],
    );
  }

  Widget _buildMinimalStyleApp(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('FocusMode'),
          variant: AppBarVariant.outlined,
          size: AppBarSize.standard,
          titleAlignment: AppBarTitleAlignment.center,
          leading: OsmeaComponents.iconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.more,
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        _buildAppContent('🧘 Minimal & focused', context),
      ],
    );
  }

  Widget _buildAppContent(String message, BuildContext context) {
    return OsmeaComponents.container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: OsmeaColors.grey[50],
        border: Border(
          top: BorderSide(color: OsmeaColors.grey[200]!),
        ),
      ),
      child: OsmeaComponents.center(
        child: OsmeaComponents.column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OsmeaComponents.text(
              message,
              textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              'App content would appear here',
              textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                fontSize: 12,
                color: OsmeaColors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationBadge(
      String count, Color color, BuildContext context) {
    return OsmeaComponents.container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: OsmeaComponents.center(
        child: OsmeaComponents.text(
          count,
          textStyle: OsmeaTextStyle.labelSmall(context).copyWith(
            color: OsmeaColors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
