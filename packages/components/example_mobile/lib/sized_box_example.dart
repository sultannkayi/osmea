import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('OSMEA SizedBox Examples'),
        elevation: 0,
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Basic SizedBox'),
            _buildBasicSizedBoxExamples(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle(context, 'Styled SizedBox'),
            _buildStyledSizedBoxExamples(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle(context, 'Interactive SizedBox'),
            _buildInteractiveSizedBoxExamples(context),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle(context, 'Convenience Methods'),
            _buildConvenienceMethodExamples(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OsmeaComponents.text(
        title,
        textStyle: OsmeaTextStyle.titleLarge(context).copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBasicSizedBoxExamples(BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          context,
          'Fixed Width & Height',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 100,
            child: _buildColoredBox(
                context, color: OsmeaColors.nordicBlue, text: 'Width: 200, Height: 100'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'Fixed Width Only',
          OsmeaComponents.sizedBox(
            width: 150,
            child: _buildColoredBox(context, color: OsmeaColors.forestHeart, text: 'Width: 150'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'Fixed Height Only',
          OsmeaComponents.sizedBox(
            height: 60,
            child: _buildColoredBox(context, color: OsmeaColors.sunsetGlow, text: 'Height: 60'),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'Empty SizedBox as Spacer',
          OsmeaComponents.column(
            children: [
              _buildColoredBox(context, color: OsmeaColors.purple, text: 'Before Spacer'),
              OsmeaComponents.sizedBox(height: 30),
              _buildColoredBox(context, color: OsmeaColors.purple, text: 'After Spacer'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStyledSizedBoxExamples(BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          context,
          'SizedBox with Container Child',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                color: OsmeaColors.ash,
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  OsmeaComponents.center(child: OsmeaComponents.text('With Container Child')),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'SizedBox with Bordered Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                border: Border.all(color: OsmeaColors.nordicBlue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: OsmeaComponents.center(
                  child: OsmeaComponents.text('With Border & BorderRadius')),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'SizedBox with Shadowed Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                color: OsmeaColors.forestHeart,
                boxShadow: [
                  BoxShadow(
                    color: OsmeaColors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: OsmeaComponents.center(
                  child: OsmeaComponents.text(
                'With BoxShadow',
                textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(
                  color: OsmeaColors.forestHeart.computeLuminance() > 0.5
                      ? OsmeaColors.black
                      : OsmeaColors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'SizedBox with Gradient Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [OsmeaColors.nordicBlue, OsmeaColors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'With Gradient',
                  textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(
                      color: OsmeaColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'SizedBox with Padded Container',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: OsmeaComponents.container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: OsmeaColors.amberFlame.withValues(alpha: 0.2), 
                border: Border.all(color: OsmeaColors.amberFlame),
              ),
              child: OsmeaComponents.container(
                color: OsmeaColors.amberFlame,
                child: OsmeaComponents.center(
                    child: OsmeaComponents.text('With Padding & Margin')),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveSizedBoxExamples(BuildContext context) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          context,
          'SizedBox with GestureDetector',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: GestureDetector(
              onTap: () {
                debugPrint('SizedBox tapped!');
              },
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.center(
                    child: OsmeaComponents.text('Tap Me!',
                        textStyle:
                            OsmeaTextStyle.bodyLarge(context).copyWith(fontWeight: FontWeight.bold))),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'SizedBox with Long Press GestureDetector',
          OsmeaComponents.sizedBox(
            width: 200,
            height: 80,
            child: GestureDetector(
              onLongPress: () {
                debugPrint('SizedBox long pressed!');
              },
              child: OsmeaComponents.container(
                decoration: BoxDecoration(
                  color: OsmeaColors.ash,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: OsmeaComponents.center(
                    child: OsmeaComponents.text('Long Press Me!',
                        textStyle:
                            OsmeaTextStyle.bodyLarge(context).copyWith(fontWeight: FontWeight.bold))),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleWithCaption(BuildContext context, String caption, Widget child) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: OsmeaComponents.text(
            caption,
            textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildColoredBox(BuildContext context, {required Color color, required String text}) {
    return OsmeaComponents.container(
      width: double.infinity,
      color: color,
      padding: const EdgeInsets.all(12),
      child: OsmeaComponents.text(
        text,
        textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(
          color: color.computeLuminance() > 0.5 ? OsmeaColors.black : OsmeaColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildConvenienceMethodExamples(BuildContext context) {
    // Since OsmeaSizedBox now only accepts standard SizedBox properties,
    // we demonstrate these using Flutter's built-in SizedBox convenience constructors
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          context,
          'Square SizedBox',
          OsmeaComponents.sizedBox(
            width: 100,
            height: 100,
            child: ColoredBox(
              color: OsmeaColors.nordicBlue,
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Square\n100x100',
                  textAlign: TextAlign.center,
                  textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(color: OsmeaColors.white),
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'Expanded SizedBox',
          OsmeaComponents.sizedBox(
            height: 80,
            width: 200,
            child: OsmeaComponents.stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: OsmeaColors.ash),
                ),
                // Use Flutter's SizedBox.expand
                SizedBox.expand(
                  child: OsmeaComponents.center(
                    child: OsmeaComponents.sizedBox(
                      child: OsmeaComponents.center(
                        child: OsmeaComponents.text(
                          'Expands to Fill Parent',
                          textStyle: OsmeaTextStyle.bodyLarge(context).copyWith(color: OsmeaColors.white),
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
          context,
          'Horizontal Spacing',
          OsmeaComponents.row(
            children: [
              OsmeaComponents.container(
                width: 50,
                height: 50,
                color: OsmeaColors.sunsetGlow,
              ),
              OsmeaComponents.sizedBox(width: 20),
              OsmeaComponents.container(
                width: 50,
                height: 50,
                color: OsmeaColors.nordicBlue,
              ),
              OsmeaComponents.sizedBox(width: 20),
              OsmeaComponents.container(
                width: 50,
                height: 50,
                color: OsmeaColors.forestHeart,
              ),
            ],
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          context,
          'Vertical Spacing',
          OsmeaComponents.column(
            children: [
              OsmeaComponents.container(
                width: 100,
                height: 20,
                color: OsmeaColors.sunsetGlow,
              ),
              OsmeaComponents.sizedBox(height: 10),
              OsmeaComponents.container(
                width: 100,
                height: 20,
                color: OsmeaColors.sunsetGlow,
              ),
              OsmeaComponents.sizedBox(height: 10),
              OsmeaComponents.container(
                width: 100,
                height: 20,
                color: OsmeaColors.sunsetGlow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
