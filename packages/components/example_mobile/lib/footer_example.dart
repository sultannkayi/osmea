import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterExample extends StatelessWidget {
  const FooterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('Footer Examples'),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.singleChildScrollView(
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.sizedBox(height: 24),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text(
                'OSMEA Footer Component',
                textStyle: OsmeaTextStyle.headlineLarge(context).copyWith(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text(
                'Modern, responsive footer component with customizable items and interactive bottom sheet integration.',
                color: Colors.grey[600],
                textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(fontSize: 16),
              ),
            ),
            OsmeaComponents.sizedBox(height: 32),

            // Default Footer
            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text('Default OSMEA Footer',
                  textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontWeight: FontWeight.w600)),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text('Standard footer with three items.',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(variant: FooterVariant.defaultFooter),
            OsmeaComponents.sizedBox(height: 32),

            // Legal Footer
            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text('Legal Footer',
                  textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontWeight: FontWeight.w600)),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text(
                  'Footer with legal links and copyright.',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(variant: FooterVariant.legal),
            OsmeaComponents.sizedBox(height: 32),

            // Social Footer
            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text('Social Footer',
                  textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontWeight: FontWeight.w600)),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text(
                  'Footer with social links and contact.',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(variant: FooterVariant.social),
            OsmeaComponents.sizedBox(height: 32),

            // Minimal Footer
            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text('Minimal Footer',
                  textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontWeight: FontWeight.w600)),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text('Simple footer with just one link.',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(variant: FooterVariant.minimal),
            OsmeaComponents.sizedBox(height: 32),

            // Text Only Footer
            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text('Text Only Footer',
                  textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontWeight: FontWeight.w600)),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text('Footer with only text, no actions.',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(
              variant: FooterVariant.textOnly,
              text: 'Built with ❤️ by the OSMEA Team',
            ),
            OsmeaComponents.sizedBox(height: 32),

            // Custom Footer
            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text('Custom Footer',
                  textStyle: OsmeaTextStyle.titleMedium(context).copyWith(fontWeight: FontWeight.w600)),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text(
                  'Custom footer with icons, custom actions, and long label for overflow.',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(
              variant: FooterVariant.custom,
              dividerColor: OsmeaColors.black,
              items: [
                OsmeaFooterItem(
                  label: 'Mail',
                  description: 'Send us an email',
                  icon: Icons.email,
                  onTap: () async {
                    final url = Uri.parse('mailto:info@osmea.com');
                    await launchUrl(url);
                  },
                ),
                OsmeaFooterItem(
                  label: 'Call',
                  description: 'Call our support',
                  icon: Icons.phone,
                  onTap: () async {
                    final url = Uri.parse('tel:+1234567890');
                    await launchUrl(url);
                  },
                ),
                OsmeaFooterItem(
                  label: 'GitHub',
                  description: 'View our GitHub page',
                  icon: Icons.code,
                  onTap: () async {
                    final url = Uri.parse(
                        'https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components');
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                ),
              ],
            ),
            OsmeaComponents.sizedBox(height: 32),

            OsmeaComponents.padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
              child: OsmeaComponents.text(
                'Create Your Own Footer',
                textStyle:
                    OsmeaTextStyle.titleLarge(context).copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            OsmeaComponents.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: OsmeaComponents.text(
                  'A footer with custom icons, colors, and actions. You can build any structure you want!',
                  color: Colors.grey[600],
                  textStyle: OsmeaTextStyle.bodySmall(context).copyWith(fontSize: 13)),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.footer(
              variant: FooterVariant.custom,
              dividerColor: OsmeaColors.black,
              items: [
                OsmeaFooterItem(
                  label: 'Mail',
                  description: 'Send us an email',
                  icon: Icons.email,
                  onTap: () async {
                    final url = Uri.parse('mailto:info@osmea.com');
                    await launchUrl(url);
                  },
                ),
                OsmeaFooterItem(
                  label: 'Call',
                  description: 'Call our support',
                  icon: Icons.phone,
                  onTap: () async {
                    final url = Uri.parse('tel:+1234567890');
                    await launchUrl(url);
                  },
                ),
                OsmeaFooterItem(
                  label: 'GitHub',
                  description: 'View our GitHub page',
                  icon: Icons.code,
                  onTap: () async {
                    final url = Uri.parse(
                        'https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components');
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                ),
              ],
            ),
            OsmeaComponents.sizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
