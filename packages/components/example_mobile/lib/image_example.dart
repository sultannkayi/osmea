import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🖼️ **OSMEA Image Examples** - Comprehensive image component examples
///
/// This example demonstrates all the different variants, sizes, and features
/// of the OSMEA Image component system.
///
/// @category Examples
/// @subcategory Image
class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('Image Examples'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: context.paddingMedium,
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('🎭 Image Variants'),
            _buildVariantsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('📏 Image Sizes'),
            _buildSizesSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🌐 Network Images'),
            _buildNetworkSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🎨 Interactive Images'),
            _buildInteractiveSection(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Hero Images'),
            _buildHeroSection(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🔧 Error & Loading States'),
            _buildStatesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OsmeaComponents.text(
        title,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildVariantsSection() {
    // Using real image from a reliable CDN
    const imageUrl =
        'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=200&h=200&fit=crop';

    return OsmeaComponents.wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildVariantCard(
          'Normal',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.normal,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Rounded',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.rounded,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Circle',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.circle,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Square',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.square,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Card',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.card,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Framed',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.framed,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Avatar',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.avatar,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Thumbnail',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.thumbnail,
            size: ImageSize.medium,
          ),
        ),
        _buildVariantCard(
          'Triangle',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.triangle,
            size: ImageSize.medium,
          ),
        ),
      ],
    );
  }

  Widget _buildVariantCard(String title, Widget image) {
    return OsmeaComponents.column(
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          title,
          fontSize: 12,
        ),
      ],
    );
  }

  Widget _buildSizesSection() {
    const imageUrl =
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=300&fit=crop';

    return OsmeaComponents.wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        _buildSizeCard(
          'Extra Small',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.rounded,
            size: ImageSize.extraSmall,
          ),
        ),
        _buildSizeCard(
          'Small',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.rounded,
            size: ImageSize.small,
          ),
        ),
        _buildSizeCard(
          'Medium',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.rounded,
            size: ImageSize.medium,
          ),
        ),
        _buildSizeCard(
          'Large',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.rounded,
            size: ImageSize.large,
          ),
        ),
        _buildSizeCard(
          'Extra Large',
          OsmeaComponents.image(
            imageUrl: imageUrl,
            variant: ImageVariant.rounded,
            size: ImageSize.extraLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildSizeCard(String title, Widget image) {
    return OsmeaComponents.column(
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          title,
          fontSize: 10,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildNetworkSection() {
    return OsmeaComponents.column(
      children: [
        // Banner style network image
        OsmeaComponents.image(
          imageUrl:
              'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800&h=400&fit=crop',
          variant: ImageVariant.banner,
          size: ImageSize.cinema,
          fit: BoxFit.cover,
        ),

        OsmeaComponents.sizedBox(height: 16),

        // Grid of network images
        OsmeaComponents.row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsmeaComponents.image(
              imageUrl:
                  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=150&h=150&fit=crop',
              variant: ImageVariant.card,
              size: ImageSize.large,
            ),
            OsmeaComponents.image(
              imageUrl:
                  'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=150&h=150&fit=crop',
              variant: ImageVariant.card,
              size: ImageSize.large,
            ),
            OsmeaComponents.image(
              imageUrl:
                  'https://images.unsplash.com/photo-1426604966848-d7adac402bff?w=150&h=150&fit=crop',
              variant: ImageVariant.card,
              size: ImageSize.large,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveSection(BuildContext context) {
    return OsmeaComponents.wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Tappable image
        OsmeaComponents.image(
          imageUrl:
              'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=120&h=120&fit=crop',
          variant: ImageVariant.card,
          size: ImageSize.large,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: OsmeaComponents.text('Image tapped!'),
                backgroundColor: OsmeaColors.nordicBlue,
              ),
            );
          },
        ),

        // Triangle shaped image
        OsmeaComponents.image(
          imageUrl:
              'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=120&h=120&fit=crop',
          variant: ImageVariant.triangle,
          size: ImageSize.large,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: OsmeaComponents.text('Triangle image tapped!'),
                backgroundColor: OsmeaColors.sunsetGlow,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.text(
          'Tap the hero image to see hero animation:',
          color: OsmeaColors.steel,
        ),
        OsmeaComponents.sizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _HeroDetailPage(),
              ),
            );
          },
          child: OsmeaComponents.image(
            imageUrl:
                'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
            variant: ImageVariant.hero,
            size: ImageSize.custom,
            width: 200,
            height: 150,
            heroTag: 'hero-image',
          ),
        ),
      ],
    );
  }

  Widget _buildStatesSection() {
    return OsmeaComponents.wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Custom error widget
        _buildStateCard(
          'Custom Error',
          OsmeaComponents.image(
            imageUrl: 'https://httpstat.us/500',
            variant: ImageVariant.rounded,
            size: ImageSize.medium,
            errorWidget: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: OsmeaColors.sunsetGlow.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: OsmeaColors.sunsetGlow.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: OsmeaColors.sunsetGlow,
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Failed',
                    style: TextStyle(
                      color: OsmeaColors.sunsetGlow,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Custom placeholder
        _buildStateCard(
          'Custom Placeholder',
          OsmeaComponents.image(
            imageUrl: null,
            variant: ImageVariant.rounded,
            size: ImageSize.medium,
            placeholder: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [OsmeaColors.nordicBlue, OsmeaColors.sunsetGlow],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.photo_library_outlined,
                color: OsmeaColors.white,
                size: 32,
              ),
            ),
          ),
        ),

        // Triangle with custom placeholder
        _buildStateCard(
          'Triangle Placeholder',
          OsmeaComponents.image(
            imageUrl: null,
            variant: ImageVariant.triangle,
            size: ImageSize.medium,
            placeholder: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [OsmeaColors.sunsetGlow, OsmeaColors.nordicBlue],
                ),
              ),
              child: const Icon(
                Icons.change_history,
                color: OsmeaColors.white,
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStateCard(String title, Widget image) {
    return OsmeaComponents.column(
      mainAxisSize: MainAxisSize.min,
      children: [
        image,
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          title,
          fontSize: 12,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Hero detail page for demonstrating hero animations
class _HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('Hero Image Detail'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.center(
        child: OsmeaComponents.column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OsmeaComponents.image(
              imageUrl:
                  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
              variant: ImageVariant.hero,
              size: ImageSize.custom,
              width: 300,
              height: 225,
              heroTag: 'hero-image',
            ),
            OsmeaComponents.sizedBox(height: 24),
            OsmeaComponents.text(
              'This is the hero image detail view!',
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
