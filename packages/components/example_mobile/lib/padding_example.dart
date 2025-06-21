import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class PaddingExample extends StatelessWidget {
  const PaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Padding Examples'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Padding'),
            _buildBasicPaddingExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Styled Padding (Using Composition)'),
            _buildStyledPaddingExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Interactive Padding (Using Composition)'),
            _buildInteractivePaddingExamples(),
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

  Widget _buildBasicPaddingExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Standard Padding - All Sides',
          OsmeaComponents.padding(
            padding: const EdgeInsets.all(16),
            child:
                _buildColoredBox(color: Colors.blue, text: 'Padding.all(16)'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Horizontal Padding Only',
          OsmeaComponents.padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildColoredBox(
                color: Colors.green, text: 'Padding.symmetric(horizontal: 24)'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Vertical Padding Only',
          OsmeaComponents.padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: _buildColoredBox(
                color: Colors.orange, text: 'Padding.symmetric(vertical: 24)'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Custom Padding (LTRB)',
          OsmeaComponents.padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 16, 24),
            child: _buildColoredBox(
                color: Colors.purple, text: 'Padding.fromLTRB(32, 8, 16, 24)'),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledPaddingExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Padding with Background (Container + Padding)',
          OsmeaComponents.container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: OsmeaComponents.padding(
              padding: const EdgeInsets.all(16),
              child:
                  _buildColoredBox(color: Colors.red, text: 'With Background'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding with Border & BorderRadius (Container + Padding)',
          OsmeaComponents.container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: OsmeaComponents.padding(
              padding: const EdgeInsets.all(16),
              child: _buildColoredBox(
                  color: Colors.yellow, text: 'With Border & BorderRadius'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding with BoxShadow (Container + Padding)',
          OsmeaComponents.container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(red: 0, green: 0, blue: 0, alpha: 0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: OsmeaComponents.padding(
              padding: const EdgeInsets.all(16),
              child:
                  _buildColoredBox(color: Colors.teal, text: 'With BoxShadow'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding with Gradient (Container + Padding)',
          OsmeaComponents.container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: OsmeaComponents.padding(
              padding: const EdgeInsets.all(16),
              child:
                  _buildColoredBox(color: Colors.white, text: 'With Gradient'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractivePaddingExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Padding with onTap (GestureDetector + Container + Padding)',
          GestureDetector(
            onTap: () {
              debugPrint('Padding tapped!');
            },
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.padding(
                padding: const EdgeInsets.all(16),
                child: _buildColoredBox(color: Colors.cyan, text: 'Tap Me!'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding with onLongPress (GestureDetector + Container + Padding)',
          GestureDetector(
            onLongPress: () {
              debugPrint('Padding long-pressed!');
            },
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.padding(
                padding: const EdgeInsets.all(16),
                child: _buildColoredBox(
                    color: Colors.deepPurple, text: 'Long Press Me!'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConvenienceMethodExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Padding All Sides',
          OsmeaComponents.padding(
            padding: const EdgeInsets.all(16),
            child:
                _buildColoredBox(color: Colors.indigo, text: 'Padding.all(16)'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding Horizontal',
          OsmeaComponents.padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildColoredBox(
                color: Colors.amber, text: 'Padding.symmetric(horizontal: 24)'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding Vertical',
          OsmeaComponents.padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: _buildColoredBox(
                color: Colors.lightGreen,
                text: 'Padding.symmetric(vertical: 24)'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Padding Only',
          OsmeaComponents.padding(
            padding: const EdgeInsets.only(
              left: 32,
              top: 8,
              right: 16,
              bottom: 24,
            ),
            child: _buildColoredBox(
                color: Colors.pink,
                text: 'Padding.only(left: 32, top: 8, right: 16, bottom: 24)'),
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
}
