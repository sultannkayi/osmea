import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Center Examples'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Center'),
            _buildBasicCenterExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Styled Center'),
            _buildStyledCenterExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Interactive Center'),
            _buildInteractiveCenterExamples(),
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

  Widget _buildBasicCenterExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Simple Center',
          _buildContainer(
            OsmeaComponents.center(
              child: _buildColoredBox(color: Colors.blue, text: 'Centered'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Width Factor',
          _buildContainer(
            OsmeaComponents.center(
              widthFactor: 0.7,
              child: _buildColoredBox(
                  color: Colors.green,
                  width: double.infinity,
                  text: 'Width Factor: 0.7'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Height Factor',
          _buildContainer(
            OsmeaComponents.center(
              heightFactor: 0.5,
              child: _buildColoredBox(
                  color: Colors.orange, text: 'Height Factor: 0.5'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Both Factors',
          _buildContainer(
            OsmeaComponents.center(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: _buildColoredBox(
                  color: Colors.purple, text: 'Width: 0.5, Height: 0.5'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledCenterExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Center with Background (using Container)',
          _buildContainer(
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.center(
                child: _buildColoredBox(
                    color: Colors.red, text: 'With Background'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Border & BorderRadius (using Container)',
          _buildContainer(
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: OsmeaComponents.center(
                child: _buildColoredBox(
                    color: Colors.teal, text: 'With Border & BorderRadius'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Padding & Margin (using Padding and Container)',
          _buildContainer(
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: OsmeaComponents.center(
                  child: _buildColoredBox(
                      color: Colors.amber, text: 'With Padding & Margin'),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with BoxShadow (using Container)',
          _buildContainer(
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: OsmeaComponents.center(
                child: _buildColoredBox(
                    color: Colors.pink, text: 'With BoxShadow'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveCenterExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Center with onTap (using GestureDetector)',
          _buildContainer(
            GestureDetector(
              onTap: () {
                debugPrint('Center tapped!');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.center(
                  child: _buildColoredBox(
                      color: Colors.deepPurple, text: 'Tap Me!'),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with onLongPress (using GestureDetector)',
          _buildContainer(
            GestureDetector(
              onLongPress: () {
                debugPrint('Center long pressed!');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.center(
                  child: _buildColoredBox(
                      color: Colors.indigo, text: 'Long Press Me!'),
                ),
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
          'Center with Width and Height Factors',
          _buildContainer(
            OsmeaComponents.center(
              child: _buildColoredBox(
                  color: Colors.blue,
                  width: double.infinity,
                  text: 'Width Factor: 0.6, Height Factor: 0.6'),
              widthFactor: 0.6,
              heightFactor: 0.6,
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Fixed Width Child',
          _buildContainer(
            OsmeaComponents.center(
              child: OsmeaComponents.sizedBox(
                width: 200,
                child: _buildColoredBox(
                    color: Colors.green, text: 'Fixed Width: 200'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Fixed Height Child',
          _buildContainer(
            OsmeaComponents.center(
              child: OsmeaComponents.sizedBox(
                height: 80,
                child: _buildColoredBox(
                    color: Colors.orange, text: 'Fixed Height: 80'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Fixed Size Child',
          _buildContainer(
            OsmeaComponents.center(
              child: OsmeaComponents.sizedBox(
                width: 180,
                height: 90,
                child: _buildColoredBox(
                    color: Colors.purple, text: 'Fixed Size: 180x90'),
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

  Widget _buildColoredBox(
      {required Color color,
      required String text,
      double? width,
      double height = 60}) {
    return Container(
      width: width,
      height: height,
      color: color,
      padding: const EdgeInsets.all(8),
      child: Center(
        child: OsmeaComponents.text(
          text,
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
