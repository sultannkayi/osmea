import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({Key? key}) : super(key: key);

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  int controlledIndex = 0;
  final List<List<String>> randomImages = List.generate(
    5,
    (i) => List.generate(
      4,
      (j) =>
          'https://picsum.photos/seed/${i * 100 + j + DateTime.now().millisecondsSinceEpoch}/600/300',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final double carouselWidth = MediaQuery.of(context).size.width * 0.9;
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text(
          'Carousel Example',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Multi Carousel'),
            OsmeaComponents.carousel(
              variant: CarouselVariant.multi,
              size: CarouselSize.large,
              width: carouselWidth,
              height: 100,
              items: const [
                Icon(Icons.code, size: 64, color: Colors.blue),
                Icon(Icons.bug_report, size: 64, color: Colors.red),
                Icon(Icons.merge_type, size: 64, color: Colors.green),
                Icon(Icons.insights, size: 64, color: Colors.purple),
                Icon(Icons.star, size: 64, color: Colors.amber),
                Icon(Icons.security, size: 64, color: Colors.teal),
                Icon(Icons.people, size: 64, color: Colors.orange),
                Icon(Icons.settings, size: 64, color: Colors.grey),
              ],
              onItemTaps: [
                () => _openUrl('https://github.com/masterfabric-mobile/osmea'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/issues'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/pulls'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/pulse'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/stargazers'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/security'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/network/members'),
                () => _openUrl('https://github.com/masterfabric-mobile/osmea/settings'),
              ],
              showArrows: true,
              showIndicators: false,
            ),
            OsmeaComponents.sizedBox(height: 32),
            _sectionTitle('Modern Dot Carousel'),
            OsmeaComponents.carousel(
              imageUrls: randomImages[0],
              variant: CarouselVariant.modern,
              size: CarouselSize.large,
              indicatorType: CarouselIndicatorType.dot,
              arrowStyle: CarouselArrowStyle.minimal,
              height: 300,
              width: carouselWidth,
              showArrows: true,
              showIndicators: true,
            ),
            OsmeaComponents.sizedBox(height: 52),
            OsmeaComponents.carousel(
              imageUrls: randomImages[0],
              variant: CarouselVariant.modern,
              size: CarouselSize.large,
              indicatorType: CarouselIndicatorType.dot,
              arrowStyle: CarouselArrowStyle.minimal,
              height: 220,
              autoPlay: CarouselAutoPlay.continuous,
              autoPlayInterval: const Duration(seconds: 4),
              width: carouselWidth,
              showArrows: false,
              showIndicators: true,
            ),
            OsmeaComponents.sizedBox(height: 32),
            _sectionTitle('Bar Indicator'),
            OsmeaComponents.carousel(
              imageUrls: randomImages[1],
              variant: CarouselVariant.standard,
              size: CarouselSize.large,
              indicatorType: CarouselIndicatorType.bar,
              arrowStyle: CarouselArrowStyle.modern,
              height: 220,
              width: carouselWidth,
              showArrows: true,
              showIndicators: true,
              loop: true,
            ),
            OsmeaComponents.sizedBox(height: 32),
            _sectionTitle('Rectangle Indicator'),
            OsmeaComponents.carousel(
              imageUrls: randomImages[2],
              variant: CarouselVariant.card,
              size: CarouselSize.large,
              indicatorType: CarouselIndicatorType.rectangle,
              arrowStyle: CarouselArrowStyle.overlay,
              height: 220,
              width: carouselWidth,
              showArrows: true,
              showIndicators: true,
              disabled: false,
            ),
            OsmeaComponents.sizedBox(height: 32),
            _sectionTitle('Gradient Indicator'),
            OsmeaComponents.carousel(
              imageUrls: randomImages[3],
              variant: CarouselVariant.hero,
              size: CarouselSize.large,
              indicatorType: CarouselIndicatorType.gradient,
              arrowStyle: CarouselArrowStyle.outside,
              height: 220,
              width: carouselWidth,
              showArrows: true,
              showIndicators: true,
              loop: true,
              autoPlay: CarouselAutoPlay.continuous,
            ),
            OsmeaComponents.sizedBox(height: 32),
            _sectionTitle('Minimal Indicator & Disabled'),
            OsmeaComponents.carousel(
              imageUrls: randomImages[4],
              variant: CarouselVariant.minimal,
              size: CarouselSize.large,
              indicatorType: CarouselIndicatorType.minimal,
              arrowStyle: CarouselArrowStyle.minimal,
              height: 220,
              width: carouselWidth,
              showArrows: true,
              showIndicators: true,
              disabled: true,
            ),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) => OsmeaComponents.padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: OsmeaComponents.text(
          text,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  void _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
