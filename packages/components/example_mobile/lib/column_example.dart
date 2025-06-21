import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📊 **OSMEA Column Examples**
///
/// This file demonstrates various ways to use the OSMEA Column component.
/// Each example showcases different properties and customization options.
///
class ColumnExampleScreen extends StatelessWidget {
  const ColumnExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Column Examples'),
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '📊 Basic Columns',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic column example
            OsmeaComponents.text('Simple column:'),
            OsmeaComponents.sizedBox(height: 8),
            basicColumnExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Column with alignment
            OsmeaComponents.text('Column with different alignments:'),
            OsmeaComponents.sizedBox(height: 8),
            alignmentColumnExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for spacing
            OsmeaComponents.text(
              '📏 Spacing & Distribution',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Column with spacing
            OsmeaComponents.text('Column with automatic spacing:'),
            OsmeaComponents.sizedBox(height: 8),
            spacingColumnExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Column with main axis distribution
            OsmeaComponents.text('Column with different distribution options:'),
            OsmeaComponents.sizedBox(height: 8),
            distributionColumnExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for wrapping
            OsmeaComponents.text(
              '🔀 Wrapping Columns',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Wrapping column examples
            OsmeaComponents.text('Column with wrapping enabled:'),
            OsmeaComponents.sizedBox(height: 8),
            wrappingColumnExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for styling
            OsmeaComponents.text(
              '🎨 Column Styling',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Styled columns
            OsmeaComponents.text('Column with backgrounds and padding:'),
            OsmeaComponents.sizedBox(height: 8),
            styledColumnExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for interactive columns
            OsmeaComponents.text(
              '👆 Interactive Columns',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Interactive columns
            OsmeaComponents.text('Column with tap events:'),
            OsmeaComponents.sizedBox(height: 8),
            interactiveColumnExamples(context),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for advanced examples
            OsmeaComponents.text(
              '🧩 Advanced Usage',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Nested columns
            OsmeaComponents.text('Nested columns and mixed layouts:'),
            OsmeaComponents.sizedBox(height: 8),
            advancedColumnExample(),
            OsmeaComponents.sizedBox(height: 32),

            // Column vs Flutter Column
            OsmeaComponents.text('OSMEA Column vs Flutter Column:'),
            OsmeaComponents.sizedBox(height: 8),
            comparisonExample(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic example of a column
  Widget basicColumnExample() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.column(
        children: [
          Container(
            height: 40,
            color: Colors.blue.shade100,
            alignment: Alignment.center,
            child: OsmeaComponents.text('Item 1'),
          ),
          Container(
            height: 40,
            color: Colors.blue.shade200,
            alignment: Alignment.center,
            child: OsmeaComponents.text('Item 2'),
          ),
          Container(
            height: 40,
            color: Colors.blue.shade300,
            alignment: Alignment.center,
            child: OsmeaComponents.text('Item 3'),
          ),
        ],
      ),
    );
  }

  // Example showing different alignment options
  Widget alignmentColumnExamples() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text('Cross-axis start alignment:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 120,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 150,
                  color: Colors.purple.shade300,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Start'),
                ),
                Container(
                  height: 30,
                  width: 120,
                  color: Colors.purple.shade400,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Start'),
                ),
                Container(
                  height: 30,
                  width: 90,
                  color: Colors.purple.shade500,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Start'),
                ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('Cross-axis center alignment:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 120,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 150,
                  color: Colors.green.shade300,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Center'),
                ),
                Container(
                  height: 30,
                  width: 120,
                  color: Colors.green.shade400,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Center'),
                ),
                Container(
                  height: 30,
                  width: 90,
                  color: Colors.green.shade500,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Center'),
                ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('Cross-axis end alignment:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 120,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 150,
                  color: Colors.orange.shade300,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('End'),
                ),
                Container(
                  height: 30,
                  width: 120,
                  color: Colors.orange.shade400,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('End'),
                ),
                Container(
                  height: 30,
                  width: 90,
                  color: Colors.orange.shade500,
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('End'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Example showing automatic spacing between items
  Widget spacingColumnExample() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text('No spacing:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              children: [
                Container(height: 30, color: Colors.teal.shade300),
                Container(height: 30, color: Colors.teal.shade400),
                Container(height: 30, color: Colors.teal.shade500),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('With 8px spacing (using SizedBox):'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              children: [
                Container(height: 30, color: Colors.amber.shade300),
                OsmeaComponents.sizedBox(height: 8),
                Container(height: 30, color: Colors.amber.shade400),
                OsmeaComponents.sizedBox(height: 8),
                Container(height: 30, color: Colors.amber.shade500),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('With 16px spacing (using SizedBox):'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              children: [
                Container(height: 30, color: Colors.deepOrange.shade300),
                OsmeaComponents.sizedBox(height: 16),
                Container(height: 30, color: Colors.deepOrange.shade400),
                OsmeaComponents.sizedBox(height: 16),
                Container(height: 30, color: Colors.deepOrange.shade500),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Example showing different main axis distribution options
  Widget distributionColumnExamples() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text('MainAxisAlignment.start:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 30, color: Colors.cyan.shade300),
                Container(height: 30, color: Colors.cyan.shade400),
                Container(height: 30, color: Colors.cyan.shade500),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('MainAxisAlignment.center:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 30, color: Colors.pink.shade300),
                Container(height: 30, color: Colors.pink.shade400),
                Container(height: 30, color: Colors.pink.shade500),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('MainAxisAlignment.end:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(height: 30, color: Colors.lime.shade300),
                Container(height: 30, color: Colors.lime.shade400),
                Container(height: 30, color: Colors.lime.shade500),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('MainAxisAlignment.spaceBetween:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 30, color: Colors.red.shade300),
                Container(height: 30, color: Colors.red.shade400),
                Container(height: 30, color: Colors.red.shade500),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('MainAxisAlignment.spaceEvenly:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            height: 150,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 30, color: Colors.blue.shade300),
                Container(height: 30, color: Colors.blue.shade400),
                Container(height: 30, color: Colors.blue.shade500),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Example showing wrapping capabilities
  Widget wrappingColumnExample() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text('Standard Column:'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            width: 200,
            height: 200,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.blueGrey.withValues(
                        red: 96, green: 125, blue: 139, alpha: 0.2 * (i + 1)),
                    alignment: Alignment.center,
                    child: OsmeaComponents.text('Item ${i + 1}',
                        textStyle: const TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text('Wrapping Column (using Flutter Wrap):'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            width: 200,
            height: 200,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(8),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 0; i < 12; i++)
                  Container(
                    height: 30,
                    width: 50,
                    color: Colors.indigo.withValues(
                        red: 63,
                        green: 81,
                        blue: 181,
                        alpha: 0.3 + ((i % 4) * 0.15)),
                    alignment: Alignment.center,
                    child: OsmeaComponents.text('${i + 1}',
                        textStyle: const TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Example showing styled columns
  Widget styledColumnExample() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text(
              'Column with background and padding (using Container):'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.blue.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: OsmeaComponents.column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                        red: 255, green: 255, blue: 255, alpha: 0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Styled Item 1'),
                ),
                OsmeaComponents.sizedBox(height: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                        red: 255, green: 255, blue: 255, alpha: 0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Styled Item 2'),
                ),
                OsmeaComponents.sizedBox(height: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                        red: 255, green: 255, blue: 255, alpha: 0.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Styled Item 3'),
                ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text(
              'Column with margin and rounded corners (using Container):'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade800,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Item 1',
                      textStyle: const TextStyle(color: Colors.white)),
                ),
                OsmeaComponents.sizedBox(height: 12),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade700,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Item 2',
                      textStyle: const TextStyle(color: Colors.white)),
                ),
                OsmeaComponents.sizedBox(height: 12),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade600,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: OsmeaComponents.text('Item 3',
                      textStyle: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Example showing interactive columns
  Widget interactiveColumnExamples(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text('Tappable Column (using GestureDetector):'),
          OsmeaComponents.sizedBox(height: 8),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: OsmeaComponents.text('Column tapped!')),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: OsmeaComponents.column(
                children: [
                  OsmeaComponents.sizedBox(height: 8),
                  const Icon(Icons.touch_app, size: 32, color: Colors.indigo),
                  OsmeaComponents.sizedBox(height: 8),
                  OsmeaComponents.text('Tap me!',
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  OsmeaComponents.sizedBox(height: 8),
                  OsmeaComponents.text('This entire column is tappable',
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text(
              'Individual tappable items (using GestureDetector):'),
          OsmeaComponents.sizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: OsmeaComponents.column(
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: OsmeaComponents.text('Item 1 tapped!')),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: OsmeaComponents.column(
                      children: [
                        OsmeaComponents.sizedBox(height: 8),
                        const Icon(Icons.touch_app, color: Colors.purple),
                        OsmeaComponents.sizedBox(height: 8),
                        OsmeaComponents.text('Tap',
                            textAlign: TextAlign.center),
                        OsmeaComponents.sizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(height: 8),
                GestureDetector(
                  onLongPress: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              OsmeaComponents.text('Item 2 long pressed!')),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: OsmeaComponents.column(
                      children: [
                        OsmeaComponents.sizedBox(height: 8),
                        const Icon(Icons.push_pin, color: Colors.blue),
                        OsmeaComponents.sizedBox(height: 8),
                        OsmeaComponents.text('Long press',
                            textAlign: TextAlign.center),
                        OsmeaComponents.sizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(height: 8),
                GestureDetector(
                  onDoubleTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              OsmeaComponents.text('Item 3 double tapped!')),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: OsmeaComponents.column(
                      children: [
                        OsmeaComponents.sizedBox(height: 8),
                        const Icon(Icons.touch_app, color: Colors.teal),
                        OsmeaComponents.sizedBox(height: 8),
                        OsmeaComponents.text('Double tap',
                            textAlign: TextAlign.center),
                        OsmeaComponents.sizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Advanced usage example
  Widget advancedColumnExample() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: OsmeaComponents.column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OsmeaComponents.text('Nested Layout Example',
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            OsmeaComponents.sizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withValues(red: 0, green: 0, blue: 0, alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: OsmeaComponents.column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                      OsmeaComponents.sizedBox(width: 12),
                      Expanded(
                        child: OsmeaComponents.column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OsmeaComponents.text('John Doe',
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            OsmeaComponents.sizedBox(height: 4),
                            OsmeaComponents.text('Designer & Developer',
                                textStyle: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  OsmeaComponents.sizedBox(height: 12),
                  const Divider(),
                  OsmeaComponents.sizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OsmeaComponents.column(
                        children: [
                          const Icon(Icons.message, color: Colors.blue),
                          OsmeaComponents.sizedBox(height: 4),
                          OsmeaComponents.text('Message',
                              textStyle: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      OsmeaComponents.column(
                        children: [
                          const Icon(Icons.call, color: Colors.green),
                          OsmeaComponents.sizedBox(height: 4),
                          OsmeaComponents.text('Call',
                              textStyle: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      OsmeaComponents.column(
                        children: [
                          const Icon(Icons.video_call, color: Colors.purple),
                          OsmeaComponents.sizedBox(height: 4),
                          OsmeaComponents.text('Video',
                              textStyle: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      OsmeaComponents.column(
                        children: [
                          const Icon(Icons.share, color: Colors.orange),
                          OsmeaComponents.sizedBox(height: 4),
                          OsmeaComponents.text(
                            'Share',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            OsmeaComponents.sizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.text(
                'This example demonstrates nesting columns and rows to create complex layouts.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Comparison between OSMEA Column and Flutter Column
  Widget comparisonExample() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    OsmeaComponents.text('OSMEA Column',
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                    OsmeaComponents.sizedBox(height: 8),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: OsmeaComponents.column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 1; i <= 3; i++)
                            Container(
                              height: 40,
                              color: i == 1
                                  ? Colors.blue.shade100
                                  : (i == 2
                                      ? Colors.blue.shade200
                                      : Colors.blue.shade300),
                              alignment: Alignment.center,
                              child: OsmeaComponents.text('Item $i'),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              OsmeaComponents.sizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    OsmeaComponents.text('Flutter Column',
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                    OsmeaComponents.sizedBox(height: 8),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 1; i <= 3; i++)
                            Container(
                              height: 40,
                              color: i == 1
                                  ? Colors.green.shade100
                                  : (i == 2
                                      ? Colors.green.shade200
                                      : Colors.green.shade300),
                              alignment: Alignment.center,
                              child: OsmeaComponents.text('Item $i'),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          OsmeaComponents.sizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: OsmeaComponents.text(
              'OSMEA Column provides the same API as Flutter\'s Column while following the OSMEA design system.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
