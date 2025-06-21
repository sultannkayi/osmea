import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎯 **Mobile-Inspired AppBars Demo**
///
/// Comprehensive showcase of OSMEA AppBar variants inspired by
/// popular mobile app designs and interfaces.
class AppbarDemo extends StatelessWidget {
  const AppbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('Mobile-Inspired AppBars'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        padding: context.paddingNormal,
        children: [
          OsmeaComponents.text(
            '📱 Mobile App Inspired Designs',
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'AppBar designs inspired by popular mobile applications',
            textStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          OsmeaComponents.sizedBox(height: 32),

          // Osmea Style - Standard Variant
          _buildMobileAppExample(
            context,
            appName: 'Osmea Style (Standard)',
            description:
                'Clean white background with left-aligned content, perfect for reading and content apps',
            preview: _buildOsmeaStyleApp(),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Social Media Style - Primary Variant
          _buildMobileAppExample(
            context,
            appName: 'Social Media Style (Primary)',
            description:
                'Brand-focused design with strong visual presence, great for social platforms',
            preview: _buildSocialMediaStyleApp(),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // E-commerce Style - Secondary Variant
          _buildMobileAppExample(
            context,
            appName: 'E-commerce Style (Secondary)',
            description:
                'Subtle and clean design perfect for shopping and marketplace apps',
            preview: _buildEcommerceStyleApp(),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Productivity Style - Surface Variant
          _buildMobileAppExample(
            context,
            appName: 'Productivity Style (Surface)',
            description:
                'Material design with balanced elevation for productivity and business apps',
            preview: _buildProductivityStyleApp(),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Entertainment Style - Gradient Variant
          _buildMobileAppExample(
            context,
            appName: 'Entertainment Style (Gradient)',
            description:
                'Vibrant gradient design for media and entertainment applications',
            preview: _buildEntertainmentStyleApp(),
          ),

          OsmeaComponents.sizedBox(height: 32),

          // Minimal Style - Outlined Variant
          _buildMobileAppExample(
            context,
            appName: 'Minimal Style (Outlined)',
            description:
                'Clean and minimal border-only design for focus-driven apps',
            preview: _buildMinimalStyleApp(),
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.text(
                  appName,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OsmeaComponents.sizedBox(height: 4),
                OsmeaComponents.text(
                  description,
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: preview,
          ),
        ],
      ),
    );
  }

  Widget _buildOsmeaStyleApp() {
    return Column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('Osmea'),
          variant: AppBarVariant.standard,
          size: AppBarSize.comfortable,
          titleAlignment: AppBarTitleAlignment.left,
          leading: IconButton(
            icon: const Icon(Icons.expand_more),
            onPressed: () {},
          ),
          actions: [
            AppBarAction(
              type: AppBarActionType.notification,
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
              badge: _buildNotificationBadge('1', Colors.green),
            ),
          ],
        ),
        _buildAppContent('📚 Your reading list awaits'),
      ],
    );
  }

  Widget _buildSocialMediaStyleApp() {
    return Column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('SocialHub'),
          variant: AppBarVariant.primary,
          size: AppBarSize.comfortable,
          titleAlignment: AppBarTitleAlignment.center,
          leading: IconButton(
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
              badge: _buildNotificationBadge('5', Colors.red),
            ),
          ],
        ),
        _buildAppContent('👋 Connect with friends'),
      ],
    );
  }

  Widget _buildEcommerceStyleApp() {
    return Column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('ShopEase'),
          subtitle: OsmeaComponents.text('Fashion & Lifestyle'),
          variant: AppBarVariant.secondary,
          size: AppBarSize.standard,
          titleAlignment: AppBarTitleAlignment.left,
          leading: IconButton(
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
              badge: _buildNotificationBadge('3', Colors.orange),
            ),
          ],
        ),
        _buildAppContent('🛍️ Discover amazing products'),
      ],
    );
  }

  Widget _buildProductivityStyleApp() {
    return Column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('TaskMaster'),
          subtitle: OsmeaComponents.text('Project Management'),
          variant: AppBarVariant.surface,
          size: AppBarSize.large,
          titleAlignment: AppBarTitleAlignment.left,
          leading: IconButton(
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
        _buildAppContent('✅ Boost your productivity'),
      ],
    );
  }

  Widget _buildEntertainmentStyleApp() {
    return Column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('StreamFlix'),
          variant: AppBarVariant.gradient,
          size: AppBarSize.comfortable,
          titleAlignment: AppBarTitleAlignment.center,
          leading: IconButton(
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
        _buildAppContent('🎬 Endless entertainment'),
      ],
    );
  }

  Widget _buildMinimalStyleApp() {
    return Column(
      children: [
        OsmeaComponents.appBar(
          title: OsmeaComponents.text('FocusMode'),
          variant: AppBarVariant.outlined,
          size: AppBarSize.standard,
          titleAlignment: AppBarTitleAlignment.center,
          leading: IconButton(
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
        _buildAppContent('🧘 Minimal & focused'),
      ],
    );
  }

  Widget _buildAppContent(String message) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OsmeaComponents.text(
              message,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              'App content would appear here',
              textStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationBadge(String count, Color color) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: OsmeaComponents.text(
          count,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
