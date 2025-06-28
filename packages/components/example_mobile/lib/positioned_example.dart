// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📦 **OSMEA Positioned Examples**
///
/// This file demonstrates various ways to use the OSMEA Positioned component,
/// which enables precise placement of widgets within a Stack.
///
class PositionedExampleScreen extends StatelessWidget {
  const PositionedExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Positioned Examples'),
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '📍 Basic Positioning',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic positioning example
            OsmeaComponents.text('Simple positioned elements:'),
            OsmeaComponents.sizedBox(height: 8),
            basicPositionedExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Corner positioning example
            OsmeaComponents.text('Positioning in corners:'),
            OsmeaComponents.sizedBox(height: 8),
            cornerPositioningExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for edge positioning
            OsmeaComponents.text(
              '📏 Edge Positioning',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Edge positioning
            OsmeaComponents.text('Positioning along edges:'),
            OsmeaComponents.sizedBox(height: 8),
            edgePositioningExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for fill and size
            OsmeaComponents.text(
              '📐 Fill and Size',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Fill example
            OsmeaComponents.text('Using positionedFill:'),
            OsmeaComponents.sizedBox(height: 8),
            fillPositioningExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Size example
            OsmeaComponents.text('Setting width and height:'),
            OsmeaComponents.sizedBox(height: 8),
            sizePositioningExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for fractional
            OsmeaComponents.text(
              '🔢 Fractional Positioning',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Fractional example
            OsmeaComponents.text('Using positionedFractional:'),
            OsmeaComponents.sizedBox(height: 8),
            fractionalPositioningExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for practical examples
            OsmeaComponents.text(
              '💡 Practical Examples',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Overlay example
            OsmeaComponents.text('Creating an overlay effect:'),
            OsmeaComponents.sizedBox(height: 8),
            overlayExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Badge example
            OsmeaComponents.text('Adding badges to elements:'),
            OsmeaComponents.sizedBox(height: 8),
            badgeExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Spacer example (new)
            OsmeaComponents.text('Spacer with positioned elements:'),
            OsmeaComponents.sizedBox(height: 8),
            spacerExample(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic positioning example
  Widget basicPositionedExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        children: [
          OsmeaComponents.positioned(
            left: 20,
            top: 20,
            child: _buildColorBox(Colors.red, 'Top Left'),
          ),
          OsmeaComponents.positioned(
            right: 20,
            top: 20,
            child: _buildColorBox(Colors.blue, 'Top Right'),
          ),
          OsmeaComponents.positioned(
            left: 20,
            bottom: 20,
            child: _buildColorBox(Colors.green, 'Bottom Left'),
          ),
          OsmeaComponents.positioned(
            right: 20,
            bottom: 20,
            child: _buildColorBox(Colors.yellow, 'Bottom Right'),
          ),
        ],
      ),
    );
  }

  // Corner positioning example
  Widget cornerPositioningExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        alignment: Alignment.center,
        children: [
          OsmeaComponents.text(
            'Center Content',
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          OsmeaComponents.positioned(
            left: 0,
            top: 0,
            child: _buildSmallColorBox(Colors.red),
          ),
          OsmeaComponents.positioned(
            right: 0,
            top: 0,
            child: _buildSmallColorBox(Colors.blue),
          ),
          OsmeaComponents.positioned(
            left: 0,
            bottom: 0,
            child: _buildSmallColorBox(Colors.green),
          ),
          OsmeaComponents.positioned(
            right: 0,
            bottom: 0,
            child: _buildSmallColorBox(Colors.purple),
          ),
        ],
      ),
    );
  }

  // Edge positioning example
  Widget edgePositioningExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        children: [
          // Center element for reference
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.white,
              child: OsmeaComponents.center(
                child: OsmeaComponents.text('Center'),
              ),
            ),
          ),

          // Top edge
          OsmeaComponents.positioned(
            left: 50,
            right: 50,
            top: 0,
            child: Container(
              height: 30,
              color: Colors.red.withOpacity(0.5),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text('Top Edge'),
              ),
            ),
          ),

          // Bottom edge
          OsmeaComponents.positioned(
            left: 50,
            right: 50,
            bottom: 0,
            child: Container(
              height: 30,
              color: Colors.blue.withOpacity(0.5),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text('Bottom Edge'),
              ),
            ),
          ),

          // Left edge
          OsmeaComponents.positioned(
            left: 0,
            top: 50,
            bottom: 50,
            child: Container(
              width: 30,
              color: Colors.green.withOpacity(0.5),
              child: OsmeaComponents.center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: OsmeaComponents.text('Left Edge'),
                ),
              ),
            ),
          ),

          // Right edge
          OsmeaComponents.positioned(
            right: 0,
            top: 50,
            bottom: 50,
            child: Container(
              width: 30,
              color: Colors.purple.withOpacity(0.5),
              child: OsmeaComponents.center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: OsmeaComponents.text('Right Edge'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fill positioning example
  Widget fillPositioningExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        children: [
          // Background element that fills the entire stack
          OsmeaComponents.positionedFill(
            child: Container(
              color: Colors.blue.withOpacity(0.2),
            ),
          ),

          // Inset element with margins
          OsmeaComponents.positionedFill(
            left: 20,
            top: 20,
            right: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.2),
                border: Border.all(color: Colors.pink),
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Inset with Margins (20px)',
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Small element at the bottom-right
          OsmeaComponents.positioned(
            right: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: OsmeaComponents.text(
                'positionedFill',
                textStyle: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Size positioning example
  Widget sizePositioningExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        alignment: Alignment.center,
        children: [
          // Fixed size positioned in center
          OsmeaComponents.positioned(
            left: 50,
            top: 50,
            width: 100,
            height: 100,
            child: Container(
              color: Colors.amber,
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Fixed Size\n(100x100)',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // Bottom right positioning with width only
          OsmeaComponents.positioned(
            right: 20,
            bottom: 20,
            width: 120,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              child: OsmeaComponents.text(
                'Width: 120px',
                textStyle: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fractional positioning example
  Widget fractionalPositioningExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        children: [
          // Half width, centered horizontally
          Center(
            child: OsmeaComponents.positioned(
              top: 20,
              width: 180, // Use fixed width instead of infinity
              height: 60, // Use fixed height instead of infinity
              child: Container(
                color: Colors.green.withOpacity(0.5),
                child: OsmeaComponents.center(
                  child: OsmeaComponents.text(
                    'width: 180px\nheight: 60px',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          // Bottom right, 30% width and height
          OsmeaComponents.positioned(
            right: 20,
            bottom: 20,
            width: 100, // Use fixed width instead of infinity
            height: 40, // Use fixed height instead of infinity
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Fixed Size',
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          // Label
          OsmeaComponents.positioned(
            left: 10,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: OsmeaComponents.text(
                'OsmeaPositioned',
                textStyle: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Overlay example
  Widget overlayExample() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color:
            Colors.grey.shade700, // Fallback color in case image fails to load
        image: DecorationImage(
          image: const NetworkImage('https://picsum.photos/seed/osmea/800/400'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
          onError: (exception, stackTrace) {
            debugPrint('Error loading image: $exception');
          },
        ),
      ),
      child: OsmeaComponents.stack(
        children: [
          // Dark gradient overlay
          OsmeaComponents.positionedFill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
          ),

          // Bottom text
          OsmeaComponents.positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                OsmeaComponents.text(
                  'Beautiful Nature',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OsmeaComponents.sizedBox(height: 4),
                OsmeaComponents.text(
                  'Using positioned for overlay text on images',
                  textStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Top-right badge
          OsmeaComponents.positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: OsmeaComponents.row(
                children: [
                  const Icon(Icons.photo_camera, size: 16, color: Colors.white),
                  OsmeaComponents.sizedBox(width: 4),
                  OsmeaComponents.text(
                    'Featured',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Spacer example with positioned elements
  Widget spacerExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        alignment: Alignment.center,
        children: [
          // Center content
          OsmeaComponents.text(
            'Content in the middle',
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Top spacer with positioned element
          OsmeaComponents.positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 40,
            child: Container(
              color: Colors.blue.withOpacity(0.3),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Top Spacer',
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Bottom spacer with positioned element
          OsmeaComponents.positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 40,
            child: Container(
              color: Colors.green.withOpacity(0.3),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Bottom Spacer',
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Left spacer with positioned element
          OsmeaComponents.positioned(
            top: 40,
            bottom: 40,
            left: 0,
            width: 40,
            child: Container(
              color: Colors.red.withOpacity(0.3),
              child: OsmeaComponents.center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: OsmeaComponents.text(
                    'Left Spacer',
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // Right spacer with positioned element
          OsmeaComponents.positioned(
            top: 40,
            bottom: 40,
            right: 0,
            width: 40,
            child: Container(
              color: Colors.purple.withOpacity(0.3),
              child: OsmeaComponents.center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: OsmeaComponents.text(
                    'Right Spacer',
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Badge example
  Widget badgeExample() {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      color: Colors.grey.shade200,
      child: OsmeaComponents.stack(
        alignment: Alignment.center,
        children: [
          // Main element
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: OsmeaComponents.row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                OsmeaComponents.sizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OsmeaComponents.text(
                        'John Doe',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OsmeaComponents.text(
                        'Software Developer',
                        textStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Badge at top-right corner
          OsmeaComponents.positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: OsmeaComponents.text(
                'Online',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Badge at bottom-left corner
          OsmeaComponents.positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: OsmeaComponents.text(
                'Pro Member',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for creating color boxes
  Widget _buildColorBox(Color color, String text) {
    return Container(
      width: 80,
      height: 80,
      color: color,
      child: OsmeaComponents.center(
        child: OsmeaComponents.text(
          text,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Helper for creating small color boxes
  Widget _buildSmallColorBox(Color color) {
    return Container(
      width: 30,
      height: 30,
      color: color,
    );
  }

}
