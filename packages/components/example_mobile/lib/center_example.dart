import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('OSMEA Center Examples'),
        elevation: 0,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: OsmeaComponents.column(
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
    return OsmeaComponents.padding(
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
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Simple Center',
          _buildContainer(
            OsmeaComponents.center(
              child: _buildColoredBox(color: OsmeaColors.blue, text: 'Centered'),
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
                  color: OsmeaColors.green,
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
                  color: OsmeaColors.orange, text: 'Height Factor: 0.5'),
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
                  color: OsmeaColors.purple, text: 'Width: 0.5, Height: 0.5'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledCenterExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Center with Background (using Container)',
          _buildContainer(
            OsmeaComponents.container(
              decoration: BoxDecoration(
                color: OsmeaColors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.center(
                child: _buildColoredBox(
                    color: OsmeaColors.red, text: 'With Background'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Border & BorderRadius (using Container)',
          _buildContainer(
            OsmeaComponents.container(
              decoration: BoxDecoration(
                border: Border.all(color: OsmeaColors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: OsmeaComponents.center(
                child: _buildColoredBox(
                    color: OsmeaColors.forestHeart, text: 'With Border & BorderRadius'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with Padding & Margin (using Padding and Container)',
          _buildContainer(
            OsmeaComponents.container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: OsmeaColors.grey.shade200,
              ),
              child: OsmeaComponents.padding(
                padding: const EdgeInsets.all(10),
                child: OsmeaComponents.center(
                  child: _buildColoredBox(
                      color: OsmeaColors.sunsetGlow, text: 'With Padding & Margin'),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center with BoxShadow (using Container)',
          _buildContainer(
            OsmeaComponents.container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: OsmeaColors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: OsmeaComponents.center(
                child: _buildColoredBox(
                    color: OsmeaColors.amberFlame, text: 'With BoxShadow'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveCenterExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Center with onTap (using GestureDetector)',
          _buildContainer(
            GestureDetector(
              onTap: () {
                debugPrint('Center tapped!');
              },
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  color: OsmeaColors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.center(
                  child: _buildColoredBox(
                      color: OsmeaColors.purple, text: 'Tap Me!'),
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
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  color: OsmeaColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.center(
                  child: _buildColoredBox(
                      color: OsmeaColors.nordicBlue, text: 'Long Press Me!'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConvenienceMethodExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Center with Width and Height Factors',
          _buildContainer(
            OsmeaComponents.center(
              child: _buildColoredBox(
                  color: OsmeaColors.blue,
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
                    color: OsmeaColors.forestHeart, text: 'Fixed Width: 200'),
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
                    color: OsmeaColors.meadow, text: 'Fixed Height: 80'),
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
                    color: OsmeaColors.purple, text: 'Fixed Size: 180x90'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleWithCaption(String caption, Widget child) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.padding(
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

  Widget _buildColoredBox({
    required Color color,
    required String text,
    double? width,
    double height = 60,
  }) {
    return OsmeaComponents.container(
      width: width,
      height: height,
      color: color,
      padding: const EdgeInsets.all(8),
      child: OsmeaComponents.center(
        child: OsmeaComponents.text(
          text,
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            color: color.computeLuminance() > 0.5 ? OsmeaColors.steel : OsmeaColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return OsmeaComponents.container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: OsmeaColors.platinum,
        border: Border.all(color: OsmeaColors.platinum),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
