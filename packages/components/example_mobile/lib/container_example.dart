import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📦 **OSMEA Container Examples**
///
/// This file demonstrates various ways to use the OSMEA Container component.
/// Each example showcases different properties and customization options.
///
class ContainerExampleScreen extends StatelessWidget {
  const ContainerExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text(
          'OSMEA Container Examples',
          variant: OsmeaTextVariant.headlineMedium,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: context.paddingNormal,
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '📦 Basic Containers',
              variant: OsmeaTextVariant.headlineSmall,
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic container example
            OsmeaComponents.text(
              'Simple container with color:',
              variant: OsmeaTextVariant.bodyMedium,
            ),
            OsmeaComponents.sizedBox(height: 8),
            basicContainerExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Container with border radius
            OsmeaComponents.text(
              'Container with border radius:',
              variant: OsmeaTextVariant.bodyMedium,
            ),
            OsmeaComponents.sizedBox(height: 8),
            roundedContainerExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Container with shadow
            OsmeaComponents.text(
              'Container with shadow:',
              variant: OsmeaTextVariant.bodyMedium,
            ),
            OsmeaComponents.sizedBox(height: 8),
            shadowContainerExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for layout containers
            OsmeaComponents.text(
              '📐 Layout & Positioning',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Containers with alignment
            OsmeaComponents.text('Containers with different alignments:'),
            OsmeaComponents.sizedBox(height: 8),
            alignmentContainerExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Containers with padding and margin
            OsmeaComponents.text('Containers with padding and margin:'),
            OsmeaComponents.sizedBox(height: 8),
            paddingMarginContainerExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Size constrained containers
            OsmeaComponents.text('Size constrained containers:'),
            OsmeaComponents.sizedBox(height: 8),
            sizeConstrainedContainerExamples(context),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for styling containers
            OsmeaComponents.text(
              '🎨 Styling & Effects',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Containers with borders
            OsmeaComponents.text('Containers with borders:'),
            OsmeaComponents.sizedBox(height: 8),
            borderedContainerExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Containers with gradients
            OsmeaComponents.text('Containers with gradients:'),
            OsmeaComponents.sizedBox(height: 8),
            gradientContainerExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Containers with background images
            OsmeaComponents.text('Containers with background images:'),
            OsmeaComponents.sizedBox(height: 8),
            backgroundImageContainerExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for interactive containers
            OsmeaComponents.text(
              '👆 Interactive Containers',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Interactive containers
            OsmeaComponents.text('Interactive containers with tap events:'),
            OsmeaComponents.sizedBox(height: 8),
            interactiveContainerExamples(context),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for shape variants
            OsmeaComponents.text(
              '🔳 Shape Variants',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Shape variant containers
            OsmeaComponents.text('Different container shapes:'),
            OsmeaComponents.sizedBox(height: 8),
            shapeVariantContainerExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for advanced examples
            OsmeaComponents.text(
              '🚀 Advanced Examples',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Complex container combinations
            OsmeaComponents.text('Complex container combinations:'),
            OsmeaComponents.sizedBox(height: 8),
            complexContainerExamples(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic container example
  Widget basicContainerExample() {
    return OsmeaComponents.container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child: Center(
        child: OsmeaComponents.text(
          'Basic Container',
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  // Rounded container example
  Widget roundedContainerExample() {
    return OsmeaComponents.container(
      width: double.infinity,
      height: 100,
      borderRadius: BorderRadius.circular(16),
      color: Colors.orange,
      child: Center(
        child: OsmeaComponents.text(
          'Rounded Container',
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  // Container with shadow example
  Widget shadowContainerExample() {
    return OsmeaComponents.container(
      width: double.infinity,
      height: 100,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.2),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
      color: Colors.white,
      child: Center(
        child: OsmeaComponents.text(
          'Shadow Container',
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // Container alignment examples
  Widget alignmentContainerExamples() {
    return Row(
      children: [
        Expanded(
          child: OsmeaComponents.container(
            height: 100,
            color: Colors.green.shade300,
            alignment: Alignment.topLeft,
            child: OsmeaComponents.text('Top Left',
                textStyle: const TextStyle(color: Colors.white)),
          ),
        ),
        OsmeaComponents.sizedBox(width: 8),
        Expanded(
          child: OsmeaComponents.container(
            height: 100,
            color: Colors.green.shade500,
            alignment: Alignment.center,
            child: OsmeaComponents.text('Center',
                textStyle: const TextStyle(color: Colors.white)),
          ),
        ),
        OsmeaComponents.sizedBox(width: 8),
        Expanded(
          child: OsmeaComponents.container(
            height: 100,
            color: Colors.green.shade700,
            alignment: Alignment.bottomRight,
            child: OsmeaComponents.text('Bottom Right',
                textStyle: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  // Container padding and margin examples
  Widget paddingMarginContainerExamples() {
    return OsmeaComponents.container(
      width: double.infinity,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.container(
        width: double.infinity,
        color: Colors.purple,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        child: OsmeaComponents.text(
          'Container with padding (16) and margin (8)',
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Size constrained container examples
  Widget sizeConstrainedContainerExamples(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        OsmeaComponents.container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Center(
              child: OsmeaComponents.text('Fixed Size', color: Colors.white)),
        ),
        OsmeaComponents.container(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 150,
            minHeight: 50,
            maxHeight: 100,
          ),
          color: Colors.amber,
          child: Center(
            child: Padding(
              padding: context.paddingLow,
              child:
                  OsmeaComponents.text('Constrained Size', color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  // Containers with borders examples
  Widget borderedContainerExamples() {
    return Column(
      children: [
        OsmeaComponents.container(
          width: double.infinity,
          height: 100,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
          child: Center(child: OsmeaComponents.text('Border All')),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.container(
          width: double.infinity,
          height: 100,
          border: const Border(
            top: BorderSide(color: Colors.red, width: 4),
            bottom: BorderSide(color: Colors.green, width: 4),
          ),
          child: Center(child: OsmeaComponents.text('Custom Border')),
        ),
      ],
    );
  }

  // Gradient container examples
  Widget gradientContainerExamples() {
    return Column(
      children: [
        OsmeaComponents.container(
          width: double.infinity,
          height: 120,
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: OsmeaComponents.text(
              'Linear Gradient',
              color: Colors.white,
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.container(
          width: double.infinity,
          height: 120,
          gradient: const RadialGradient(
            colors: [Colors.amber, Colors.deepOrange],
            center: Alignment.center,
            radius: 0.7,
          ),
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: OsmeaComponents.text(
              'Radial Gradient',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // Background image container example
  Widget backgroundImageContainerExample() {
    return OsmeaComponents.container(
      width: double.infinity,
      height: 150,
      borderRadius: BorderRadius.circular(12),
      backgroundImage: const DecorationImage(
        image: NetworkImage('https://picsum.photos/500/300'),
        fit: BoxFit.cover,
      ),
      child: OsmeaComponents.container(
        borderRadius: BorderRadius.circular(12),
        alignment: Alignment.center,
        color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.5),
        child: OsmeaComponents.text(
          'Container with Background Image',
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  // Interactive container examples
  Widget interactiveContainerExamples(BuildContext context) {
    return Column(
      children: [
        OsmeaComponents.container(
          width: double.infinity,
          height: 100,
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: OsmeaComponents.text('Container tapped!')),
            );
          },
          child: Center(
            child: OsmeaComponents.text(
              'Tap Me',
              color: Colors.white,
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.container(
          width: double.infinity,
          height: 100,
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(8),
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: OsmeaComponents.text('Container long pressed!')),
            );
          },
          child: Center(
            child: OsmeaComponents.text(
              'Long Press Me',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // Shape variant container examples
  Widget shapeVariantContainerExamples() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        OsmeaComponents.container(
          width: 100,
          height: 100,
          color: Colors.teal,
          shape: BoxShape.circle,
          child: Center(
            child: OsmeaComponents.text(
              'Circle',
              color: Colors.white,
            ),
          ),
        ),
        OsmeaComponents.container(
          width: 100,
          height: 100,
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: OsmeaComponents.text(
              'Rounded',
              color: Colors.white,
            ),
          ),
        ),
        OsmeaComponents.container(
          width: 100,
          height: 100,
          color: Colors.amber,
          child: Center(
            child: OsmeaComponents.text('Square'),
          ),
        ),
      ],
    );
  }

  // Complex container combination examples
  Widget complexContainerExamples() {
    return OsmeaComponents.container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      gradient: LinearGradient(
        colors: [Colors.blue.shade800, Colors.blue.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.blue.shade200
              .withValues(red: 144, green: 202, blue: 249, alpha: 0.6),
          blurRadius: 15,
          offset: const Offset(0, 8),
          spreadRadius: 2,
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          OsmeaComponents.text(
            'Premium Card',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'This card demonstrates multiple container properties combined',
            color: Colors.white70,
          ),
          OsmeaComponents.sizedBox(height: 16),
          Row(
            children: [
              OsmeaComponents.container(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
                    .withValues(red: 255, green: 255, blue: 255, alpha: 0.2),
                child: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ),
              OsmeaComponents.sizedBox(width: 12),
              OsmeaComponents.expanded(
                child: OsmeaComponents.text(
                  'Advanced styling with nested containers',
                  color: Colors.white,
                ),
              ),
            ],
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
            child: OsmeaComponents.text(
              'DETAILS',
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Main entry point for the container examples
void main() {
  runApp(const MaterialApp(
    title: 'OSMEA Container Examples',
    home: ContainerExampleScreen(),
  ));
}
