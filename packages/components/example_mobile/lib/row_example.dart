import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔄 **OSMEA Row Examples**
///
/// This file demonstrates various ways to use the OSMEA Row component,
/// which follows Flutter's Row API.
///
class RowExampleScreen extends StatelessWidget {
  const RowExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Row Examples'),
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '🔄 Basic Rows',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic row example
            OsmeaComponents.text('Simple row:'),
            OsmeaComponents.sizedBox(height: 8),
            basicRowExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Row with alignment
            OsmeaComponents.text('Row with different alignments:'),
            OsmeaComponents.sizedBox(height: 8),
            alignmentRowExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for spacing
            OsmeaComponents.text(
              '📏 Spacing & Distribution (Using Composition)',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Row with spacing
            OsmeaComponents.text('Row with spacing using SizedBox:'),
            OsmeaComponents.sizedBox(height: 8),
            spacingRowExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Row with main axis distribution
            OsmeaComponents.text('Row with different distribution options:'),
            OsmeaComponents.sizedBox(height: 8),
            distributionRowExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for wrapping
            OsmeaComponents.text(
              '🔀 Wrapping Rows (Using Composition)',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Wrapping row examples
            OsmeaComponents.text('Using Wrap instead of Row for wrapping:'),
            OsmeaComponents.sizedBox(height: 8),
            wrappingRowExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for styling
            OsmeaComponents.text(
              '🎨 Row Styling (Using Composition)',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Styled rows
            OsmeaComponents.text('Row with Container for styling:'),
            OsmeaComponents.sizedBox(height: 8),
            styledRowExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for interactive rows
            OsmeaComponents.text(
              '👆 Interactive Rows (Using Composition)',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Interactive rows
            OsmeaComponents.text('Row with GestureDetector for interaction:'),
            OsmeaComponents.sizedBox(height: 8),
            interactiveRowExamples(context),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for advanced examples
            OsmeaComponents.text(
              '🚀 Advanced Examples (Using Composition)',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Complex row combinations
            OsmeaComponents.text('Complex row combinations:'),
            OsmeaComponents.sizedBox(height: 8),
            complexRowExamples(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic row example
  Widget basicRowExample() {
    return OsmeaComponents.row(
      children: [
        Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ],
    );
  }

  // Row alignment examples
  Widget alignmentRowExamples() {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  // Row with spacing example using SizedBox
  Widget spacingRowExample() {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.row(
        children: [
          _buildColorBox(Colors.red),
          OsmeaComponents.sizedBox(width: 16),
          _buildColorBox(Colors.green),
          OsmeaComponents.sizedBox(width: 16),
          _buildColorBox(Colors.blue),
          OsmeaComponents.sizedBox(width: 16),
          _buildColorBox(Colors.purple),
        ],
      ),
    );
  }

  // Row distribution examples
  Widget distributionRowExamples() {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
        Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColorBox(Colors.red),
              _buildColorBox(Colors.green),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  // Wrapping row example using Wrap
  Widget wrappingRowExample() {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _buildColorBox(Colors.red),
          _buildColorBox(Colors.green),
          _buildColorBox(Colors.blue),
          _buildColorBox(Colors.purple),
          _buildColorBox(Colors.orange),
          _buildColorBox(Colors.teal),
          _buildColorBox(Colors.pink),
          _buildColorBox(Colors.amber),
        ],
      ),
    );
  }

  // Styled row example
  Widget styledRowExample() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue
                .withValues(red: 0, green: 122, blue: 255, alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue),
            boxShadow: [
              BoxShadow(
                color: Colors.blue
                    .withValues(red: 0, green: 122, blue: 255, alpha: 0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildColorBox(Colors.red),
              OsmeaComponents.sizedBox(width: 16),
              _buildColorBox(Colors.green),
              OsmeaComponents.sizedBox(width: 16),
              _buildColorBox(Colors.blue),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple
                    .withValues(red: 156, green: 39, blue: 176, alpha: 0.3),
                Colors.pink
                    .withValues(red: 233, green: 30, blue: 99, alpha: 0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColorBox(Colors.amber),
              _buildColorBox(Colors.deepOrange),
              _buildColorBox(Colors.indigo),
            ],
          ),
        ),
      ],
    );
  }

  // Interactive row examples
  Widget interactiveRowExamples(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: OsmeaComponents.text('Row tapped!')),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: OsmeaComponents.row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.touch_app),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.text('Tap this row'),
                OsmeaComponents.sizedBox(width: 8),
                const Icon(Icons.touch_app),
              ],
            ),
          ),
        ),
        GestureDetector(
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: OsmeaComponents.text('Row long-pressed!')),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: OsmeaComponents.row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.touch_app),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.text('Long press this row'),
                OsmeaComponents.sizedBox(width: 8),
                const Icon(Icons.touch_app),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Advanced row examples
  Widget complexRowExamples() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.blue
                  .withValues(red: 0, green: 122, blue: 255, alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: OsmeaComponents.row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OsmeaComponents.row(
                  children: [
                    const Icon(Icons.account_circle, size: 32),
                    OsmeaComponents.sizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OsmeaComponents.text(
                          'John Doe',
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        OsmeaComponents.text(
                          'Online',
                          textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                OsmeaComponents.row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.videocam),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green
                  .withValues(red: 76, green: 175, blue: 80, alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: OsmeaComponents.row(
              children: [
                const Icon(Icons.shopping_cart, size: 24),
                OsmeaComponents.sizedBox(width: 8),
                Expanded(
                  child: OsmeaComponents.text('Your shopping cart'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: OsmeaComponents.text(
                    '3 items',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create colored boxes
  Widget _buildColorBox(Color color) {
    return Container(
      width: 40,
      height: 40,
      color: color,
    );
  }
}
