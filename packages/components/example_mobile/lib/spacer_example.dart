import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📏 **OSMEA Spacer Examples**
///
/// This file demonstrates various ways to use the OSMEA Spacer component,
/// which enables flexible space distribution within Row and Column layouts.
///
class SpacerExampleScreen extends StatelessWidget {
  const SpacerExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Spacer Examples'),
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '📏 Basic Spacers in Row',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic row with spacer example
            OsmeaComponents.text('Spacer pushing items apart:'),
            OsmeaComponents.sizedBox(height: 8),
            basicRowSpacerExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Multiple spacers example
            OsmeaComponents.text('Multiple spacers with different flex:'),
            OsmeaComponents.sizedBox(height: 8),
            multipleSpacersExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for column spacers
            OsmeaComponents.text(
              '📏 Spacers in Column',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Column with spacers example
            OsmeaComponents.text('Spacers in a column:'),
            OsmeaComponents.sizedBox(height: 8),
            columnSpacersExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for practical examples
            OsmeaComponents.text(
              '💡 Practical Examples',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // App bar layout example
            OsmeaComponents.text('App bar-like layout:'),
            OsmeaComponents.sizedBox(height: 8),
            appBarLayoutExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Card with actions example
            OsmeaComponents.text('Card with actions:'),
            OsmeaComponents.sizedBox(height: 8),
            cardWithActionsExample(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic row with spacer example
  Widget basicRowSpacerExample() {
    return Container(
      height: 60,
      color: Colors.grey.shade200,
      child: OsmeaComponents.row(
        children: [
          _buildColorBox(Colors.red, 'Left'),
          OsmeaComponents.spacer(), // Pushes the right box to the end
          _buildColorBox(Colors.blue, 'Right'),
        ],
      ),
    );
  }

  // Multiple spacers example
  Widget multipleSpacersExample() {
    return Container(
      height: 60,
      color: Colors.grey.shade200,
      child: OsmeaComponents.row(
        children: [
          _buildColorBox(Colors.red, 'Left'),
          OsmeaComponents.spacer(flex: 1), // 1 part of space
          _buildColorBox(Colors.green, 'Middle'),
          OsmeaComponents.spacer(flex: 2), // 2 parts of space (twice as much)
          _buildColorBox(Colors.blue, 'Right'),
        ],
      ),
    );
  }

  // Column with spacers example
  Widget columnSpacersExample() {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: OsmeaComponents.column(
        children: [
          _buildColorBox(Colors.red, 'Top'),
          OsmeaComponents.spacer(), // Pushes middle and bottom down
          _buildColorBox(Colors.green, 'Middle'),
          OsmeaComponents.spacer(flex: 2), // Extra space before bottom
          _buildColorBox(Colors.blue, 'Bottom'),
        ],
      ),
    );
  }

  // App bar layout example using spacers
  Widget appBarLayoutExample() {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OsmeaComponents.row(
        children: [
          const Icon(Icons.menu, color: Colors.white),
          OsmeaComponents.sizedBox(width: 16),
          OsmeaComponents.text(
            'App Title',
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          OsmeaComponents.spacer(), // Pushes actions to the end
          const Icon(Icons.search, color: Colors.white),
          OsmeaComponents.sizedBox(width: 16),
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }

  // Card with actions using spacers
  Widget cardWithActionsExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.text(
              'Card Title',
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              'This is the content of the card that demonstrates using spacers to layout buttons.',
            ),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.row(
              children: [
                OsmeaComponents.button(
                  text: 'Cancel',
                  variant: ButtonVariant.outlined,
                  onPressed: () {},
                ),
                OsmeaComponents.spacer(), // Pushes the save button to the right
                OsmeaComponents.button(
                  text: 'Save',
                  variant: ButtonVariant.primary,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper for creating color boxes
  Widget _buildColorBox(Color color, String text) {
    return Container(
      width: 80,
      height: 60,
      color: color,
      child: Center(
        child: OsmeaComponents.text(
          text,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
