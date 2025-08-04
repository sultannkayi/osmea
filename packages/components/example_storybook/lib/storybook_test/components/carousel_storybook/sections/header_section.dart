import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🎠 **Carousel Header Section**
/// 
/// Displays the main header for carousel showcase with title and description

class CarouselHeaderSection extends StatelessWidget {
  const CarouselHeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(12),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            '🎠 Carousel Component',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: OsmeaColors.nordicBlue,
          ),
        ],
      ),
    );
  }


} 