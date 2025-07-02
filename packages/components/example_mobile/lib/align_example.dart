import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class AlignExample extends StatelessWidget {
  const AlignExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text(
          'OSMEA Align Examples',
          variant: OsmeaTextVariant.headlineMedium,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
        elevation: 0,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Alignment'),
            _buildBasicAlignExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Styled Alignment'),
            _buildStyledAlignExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Interactive Alignment'),
            _buildInteractiveAlignExamples(),
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
        variant: OsmeaTextVariant.headlineSmall,
      ),
    );
  }

  Widget _buildBasicAlignExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Top Left Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topLeft,
              child: _buildColoredBox(
                  color: OsmeaColors.nordicBlue, text: 'Top Left'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Top Center Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topCenter,
              child: _buildColoredBox(
                  color: OsmeaColors.forestHeart, text: 'Top Center'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Top Right Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topRight,
              child: _buildColoredBox(
                  color: OsmeaColors.sunsetGlow, text: 'Top Right'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center Left Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.centerLeft,
              child: _buildColoredBox(
                  color: OsmeaColors.pineGrove, text: 'Center Left'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.center,
              child: _buildColoredBox(
                  color: OsmeaColors.amberFlame, text: 'Center'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Custom Alignment (0.3, -0.5)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: const Alignment(0.3, -0.5),
              child: _buildColoredBox(
                  color: OsmeaColors.goldenHour, text: 'Custom (0.3, -0.5)'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledAlignExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Align with Container Background',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.center,
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _buildColoredBox(
                    color: OsmeaColors.forestHeart, text: 'With Background'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Align with Container Border',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.center,
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  border: Border.all(color: OsmeaColors.nordicBlue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _buildColoredBox(
                    color: OsmeaColors.sunsetGlow,
                    text: 'With Border & BorderRadius'),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Align with Container Padding & Margin',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.bottomRight,
              child: OsmeaComponents.container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: _buildColoredBox(
                    color: OsmeaColors.silver, text: 'With Padding & Margin'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveAlignExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Align with GestureDetector',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  debugPrint('Align tapped!');
                },
                child: OsmeaComponents.container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _buildColoredBox(
                      color: OsmeaColors.crystalBay, text: 'Tap Me!'),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Align with Width & Height Factors',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.center,
              widthFactor: 0.8,
              heightFactor: 0.5,
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: OsmeaColors.eclipse),
                ),
                child: _buildColoredBox(
                    color: Colors.indigo,
                    text: 'Width Factor: 0.8, Height Factor: 0.5'),
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
          'OsmeaComponents.align(alignment: Alignment.topLeft)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topLeft,
              child: _buildColoredBox(
                  color: OsmeaColors.nordicBlue, text: 'Top Left'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'OsmeaComponents.align(alignment: Alignment.centerRight)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.centerRight,
              child: _buildColoredBox(
                  color: OsmeaColors.forestHeart, text: 'Center Right'),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'OsmeaComponents.align(alignment: Alignment.bottomCenter)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.bottomCenter,
              child: _buildColoredBox(
                  color: OsmeaColors.sunsetGlow, text: 'Bottom Center'),
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
    double width = 120,
    double height = 60,
  }) {
    return OsmeaComponents.container(
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

  Widget _buildAlignmentContainer(Widget child) {
    return OsmeaComponents.container(
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
