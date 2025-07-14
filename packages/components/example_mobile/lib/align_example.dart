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
            _buildBasicAlignExamples(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Styled Alignment'),
            _buildStyledAlignExamples(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Interactive Alignment'),
            _buildInteractiveAlignExamples(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Convenience Methods'),
            _buildConvenienceMethodExamples(context),
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

  Widget _buildBasicAlignExamples(BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Top Left Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topLeft,
              child: _buildColoredBox(
                  color: OsmeaColors.nordicBlue, text: 'Top Left', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Top Center Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topCenter,
              child: _buildColoredBox(
                  color: OsmeaColors.forestHeart, text: 'Top Center', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Top Right Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topRight,
              child: _buildColoredBox(
                  color: OsmeaColors.sunsetGlow, text: 'Top Right', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center Left Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.centerLeft,
              child: _buildColoredBox(
                  color: OsmeaColors.pineGrove, text: 'Center Left', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Center Alignment',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.center,
              child: _buildColoredBox(
                  color: OsmeaColors.amberFlame, text: 'Center', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Custom Alignment (0.3, -0.5)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: const Alignment(0.3, -0.5),
              child: _buildColoredBox(
                  color: OsmeaColors.goldenHour, text: 'Custom (0.3, -0.5)', context: context),
            ),
          ),
          context,
        ),
      ],
    );
  }

  Widget _buildStyledAlignExamples(BuildContext context) {
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
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _buildColoredBox(
                    color: OsmeaColors.forestHeart, text: 'With Background', context: context),
              ),
            ),
          ),
          context,
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
                    text: 'With Border & BorderRadius', context: context),
              ),
            ),
          ),
          context,
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
                  color: OsmeaColors.ash,
                ),
                child: _buildColoredBox(
                    color: OsmeaColors.silver, text: 'With Padding & Margin', context: context),
              ),
            ),
          ),
          context,
        ),
      ],
    );
  }

  Widget _buildInteractiveAlignExamples(BuildContext context) {
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
                    color: OsmeaColors.ash,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _buildColoredBox(
                      color: OsmeaColors.crystalBay, text: 'Tap Me!', context: context),
                ),
              ),
            ),
          ),
          context,
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
                  color: OsmeaColors.crystalBay,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: OsmeaColors.eclipse),
                ),
                child: _buildColoredBox(
                    color: OsmeaColors.nordicBlue,
                    text: 'Width Factor: 0.8, Height Factor: 0.5', context: context),
              ),
            ),
          ),
          context,
        ),
      ],
    );
  }

  Widget _buildConvenienceMethodExamples(BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'OsmeaComponents.align(alignment: Alignment.topLeft)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.topLeft,
              child: _buildColoredBox(
                  color: OsmeaColors.nordicBlue, text: 'Top Left', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'OsmeaComponents.align(alignment: Alignment.centerRight)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.centerRight,
              child: _buildColoredBox(
                  color: OsmeaColors.forestHeart, text: 'Center Right', context: context),
            ),
          ),
          context,
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'OsmeaComponents.align(alignment: Alignment.bottomCenter)',
          _buildAlignmentContainer(
            OsmeaComponents.align(
              alignment: Alignment.bottomCenter,
              child: _buildColoredBox(
                  color: OsmeaColors.sunsetGlow, text: 'Bottom Center', context: context),
            ),
          ),
          context,
        ),
      ],
    );
  }

  Widget _buildExampleWithCaption(String caption, Widget child, BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: OsmeaComponents.text(
            caption,
            textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
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
    required BuildContext context,
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
          textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
            color: color.computeLuminance() > 0.5 ? OsmeaColors.black : OsmeaColors.white,
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
        color: OsmeaColors.snow,
        border: Border.all(color: OsmeaColors.platinum),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
