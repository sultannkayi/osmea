import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎠 **Carousel Demo Widget**
/// 
/// Simple demo widget for showcasing individual carousel examples
/// Used in sections and other showcase components

class CarouselDemoWidget extends StatelessWidget {
  final String title;
  final String description;
  final Widget carousel;
  final Color? backgroundColor;

  const CarouselDemoWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.carousel,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? OsmeaColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: OsmeaColors.silver),
      ),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: OsmeaColors.nordicBlue,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            description,
            fontSize: 12,
            color: OsmeaColors.slate,
            maxLines: 2,
          ),
          OsmeaComponents.sizedBox(height: 16),
          carousel,
        ],
      ),
    );
  }
} 