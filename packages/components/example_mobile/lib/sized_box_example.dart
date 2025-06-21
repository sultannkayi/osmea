import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA SizedBox Examples'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic SizedBox'),
            _buildBasicSizedBoxExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Styled SizedBox'),
            _buildStyledSizedBoxExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Interactive SizedBox'),
            _buildInteractiveSizedBoxExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Convenience Methods'),
            _buildConvenienceMethodExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OsmeaComponents.text(
        title,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBasicSizedBoxExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Fixed Width & Height',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 100,
            child: _buildColoredBox(
                color: Colors.blue, text: 'Width: 200, Height: 100'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Fixed Width Only',
          OsmeaComponents.sizedBox(
            width: 150,
            child: _buildColoredBox(color: Colors.green, text: 'Width: 150'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Fixed Height Only',
          OsmeaComponents.sizedBox(
            height: 60,
            child: _buildColoredBox(color: Colors.orange, text: 'Height: 60'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Empty SizedBox as Spacer',
          Column(
            children: [
              _buildColoredBox(color: Colors.purple, text: 'Before Spacer'),
              OsmeaComponents.sizedBox(height: 30),
              _buildColoredBox(color: Colors.purple, text: 'After Spacer'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStyledSizedBoxExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'SizedBox with Container Child',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  Center(child: OsmeaComponents.text('With Container Child')),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'SizedBox with Bordered Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: OsmeaComponents.text('With Border & BorderRadius')),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'SizedBox with Shadowed Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                  child: OsmeaComponents.text(
                'With BoxShadow',
                textStyle: TextStyle(
                  color: Colors.teal.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'SizedBox with Gradient Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: OsmeaComponents.text(
                  'With Gradient',
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'SizedBox with Padded Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(color: Colors.amber),
              ),
              child: Container(
                color: Colors.amber,
                child: Center(
                    child: OsmeaComponents.text('With Padding & Margin')),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveSizedBoxExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'SizedBox with GestureDetector',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: GestureDetector(
              onTap: () {
                debugPrint('SizedBox tapped!');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: OsmeaComponents.text('Tap Me!',
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'SizedBox with Long Press GestureDetector',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: GestureDetector(
              onLongPress: () {
                debugPrint('SizedBox long pressed!');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: OsmeaComponents.text('Long Press Me!',
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleWithCaption(String caption, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: OsmeaComponents.text(
            caption,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildColoredBox({required Color color, required String text}) {
    return Container(
      width: double.infinity,
      color: color,
      padding: const EdgeInsets.all(12),
      child: OsmeaComponents.text(
        text,
        textStyle: TextStyle(
          color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildConvenienceMethodExamples() {
    // Since OsmeaSizedBox now only accepts standard SizedBox properties,
    // we demonstrate these using Flutter's built-in SizedBox convenience constructors
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Square SizedBox',
          OsmeaComponents.sizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(
              color: Colors.deepPurple,
              child: Center(
                child: OsmeaComponents.text(
                  'Square\n100x100',
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Expanded SizedBox',
          OsmeaComponents.sizedBox(
            height: 80,
            width: 200,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: ColoredBox(color: Colors.grey),
                ),
                // Use Flutter's SizedBox.expand
                SizedBox.expand(
                  child: Center(
                    child: OsmeaComponents.sizedBox(
                      child: Center(
                        child: OsmeaComponents.text(
                          'Expands to Fill Parent',
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Horizontal Spacing',
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              OsmeaComponents.sizedBox(width: 20),
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
              OsmeaComponents.sizedBox(width: 20),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Vertical Spacing',
          Column(
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.orange,
              ),
              OsmeaComponents.sizedBox(height: 10),
              Container(
                width: 100,
                height: 20,
                color: Colors.orange,
              ),
              OsmeaComponents.sizedBox(height: 10),
              Container(
                width: 100,
                height: 20,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
