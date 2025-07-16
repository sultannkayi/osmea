import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';

class TextKnobsConfig {
  // Shared text content knob for all widgets
  static String getSharedTextContent(KnobsBuilder knobs) {
    return knobs.text(
      label: 'Text Content (All Widgets)',
      initial: 'Osmea Example Text',
    );
  }


  // Widget 1: Variant type and size knobs
  static const List<Option<String>> variantTypeOptions = [
    Option(label: 'Display', value: 'display'),
    Option(label: 'Headline', value: 'headline'),
    Option(label: 'Title', value: 'title'),
    Option(label: 'Body', value: 'body'),
    Option(label: 'Label', value: 'label'),
  ];

  static const List<Option<String>> variantSizeOptions = [
    Option(label: 'Small', value: 'small'),
    Option(label: 'Medium', value: 'medium'),
    Option(label: 'Large', value: 'large'),
  ];

  static String getVariantTypeKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Variant Type',
      initial: 'body',
      options: variantTypeOptions,
    );
  }

  static String getVariantSizeKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Variant Size',
      initial: 'large',
      options: variantSizeOptions,
    );
  }

  // Widget 2: Size, weight, color knobs only
  static double? getFontSizeKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Font Size',
      initial: null,
      options: [
        const Option(label: 'Default', value: null),
        const Option(label: '12.0', value: 12.0),
        const Option(label: '14.0', value: 14.0),
        const Option(label: '16.0', value: 16.0),
        const Option(label: '18.0', value: 18.0),
        const Option(label: '20.0', value: 20.0),
        const Option(label: '24.0', value: 24.0),
        const Option(label: '28.0', value: 28.0),
        const Option(label: '32.0', value: 32.0),
      ],
    );
  }

  static FontWeight? getFontWeightKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Font Weight',
      initial: null,
      options: [
        const Option(label: 'Default', value: null),
        const Option(label: 'w100', value: FontWeight.w100),
        const Option(label: 'w200', value: FontWeight.w200),
        const Option(label: 'w300', value: FontWeight.w300),
        const Option(label: 'w400', value: FontWeight.w400),
        const Option(label: 'w500', value: FontWeight.w500),
        const Option(label: 'w600', value: FontWeight.w600),
        const Option(label: 'w700', value: FontWeight.w700),
        const Option(label: 'w800', value: FontWeight.w800),
        const Option(label: 'w900', value: FontWeight.w900),
      ],
    );
  }

  static Color? getColorKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Color',
      initial: null,
      options: [
        const Option(label: 'Default', value: null),
        const Option(label: 'Black', value: Colors.black),
        const Option(label: 'White', value: Colors.white),
        const Option(label: 'Red', value: Colors.red),
        const Option(label: 'Blue', value: Colors.blue),
        const Option(label: 'Green', value: Colors.green),
        const Option(label: 'Orange', value: Colors.orange),
        const Option(label: 'Purple', value: Colors.purple),
        const Option(label: 'Grey', value: Colors.grey),
      ],
    );
  }

  // Widget 3: All list 3 features
  static FontStyle getFontStyleKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Font Style',
      initial: FontStyle.normal,
      options: [
        const Option(label: 'Normal', value: FontStyle.normal),
        const Option(label: 'Italic', value: FontStyle.italic),
      ],
    );
  }

  static TextDecoration getTextDecorationKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Text Decoration',
      initial: TextDecoration.none,
      options: [
        const Option(label: 'None', value: TextDecoration.none),
        const Option(label: 'Underline', value: TextDecoration.underline),
        const Option(label: 'Overline', value: TextDecoration.overline),
        const Option(label: 'Line Through', value: TextDecoration.lineThrough),
      ],
    );
  }

  static TextAlign getTextAlignKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Text Align',
      initial: TextAlign.left,
      options: [
        const Option(label: 'Left', value: TextAlign.left),
        const Option(label: 'Center', value: TextAlign.center),
        const Option(label: 'Right', value: TextAlign.right),
        const Option(label: 'Justify', value: TextAlign.justify),
        const Option(label: 'Start', value: TextAlign.start),
        const Option(label: 'End', value: TextAlign.end),
      ],
    );
  }

  static int? getMaxLinesKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Max Lines',
      initial: null,
      options: [
        const Option(label: 'Default', value: null),
        const Option(label: '1', value: 1),
        const Option(label: '2', value: 2),
        const Option(label: '3', value: 3),
        const Option(label: '4', value: 4),
        const Option(label: '5', value: 5),
      ],
    );
  }

  static TextOverflow getOverflowKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Overflow',
      initial: TextOverflow.clip,
      options: [
        const Option(label: 'Clip', value: TextOverflow.clip),
        const Option(label: 'Fade', value: TextOverflow.fade),
        const Option(label: 'Ellipsis', value: TextOverflow.ellipsis),
        const Option(label: 'Visible', value: TextOverflow.visible),
      ],
    );
  }

  static bool getSelectableKnob(KnobsBuilder knobs) {
    return knobs.boolean(label: 'Selectable', initial: false);
  }


  static bool getInteractiveKnob(KnobsBuilder knobs) {
    return knobs.boolean(label: 'Interactive', initial: false);
  }

  static double getLetterSpacingKnob(KnobsBuilder knobs) {
    return knobs.slider(
      label: 'Letter Spacing',
      initial: 0.0,
      min: 0.0,
      max: 5.0,
    );
  }

  static double getWordSpacingKnob(KnobsBuilder knobs) {
    return knobs.slider(
      label: 'Word Spacing',
      initial: 0.0,
      min: 0.0,
      max: 20.0,
    );
  }

  static double getLineHeightKnob(KnobsBuilder knobs) {
    return knobs.slider(
      label: 'Line Height',
      initial: 1.0,
      min: 1.0,
      max: 3.0,
    );
  }

  static TextDirection getTextDirectionKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Text Direction',
      initial: TextDirection.ltr,
      options: [
        const Option(label: 'Left to Right', value: TextDirection.ltr),
        const Option(label: 'Right to Left', value: TextDirection.rtl),
      ],
    );
  }

  static bool getSoftWrapKnob(KnobsBuilder knobs) {
    return knobs.boolean(label: 'Soft Wrap', initial: true);
  }

  static Locale? getLocaleKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Locale',
      initial: null,
      options: [
        const Option(label: 'Default', value: null),
        const Option(label: 'English (US)', value: Locale('en', 'US')),
        const Option(label: 'Arabic (AE)', value: Locale('ar', 'AE')),
        const Option(label: 'Turkish (TR)', value: Locale('tr', 'TR')),
        const Option(label: 'German (DE)', value: Locale('de', 'DE')),
      ],
    );
  }

  static double getTextScaleFactorKnob(KnobsBuilder knobs) {
    return knobs.slider(
      label: 'Text Scale Factor',
      initial: 1.0,
      min: 0.5,
      max: 2.0,
    );
  }

  static Shadow? getTextShadowKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Text Shadow',
      initial: null,
      options: [
        const Option(label: 'None', value: null),
        const Option(
          label: 'Light Shadow',
          value: Shadow(
            offset: Offset(1, 1),
            blurRadius: 2,
            color: Colors.black26,
          ),
        ),
        const Option(
          label: 'Medium Shadow',
          value: Shadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }

  static Color? getBackgroundColorKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Background Color',
      initial: null,
      options: [
        const Option(label: 'None', value: null),
        Option(label: 'Light Grey', value: Colors.grey[100]),
        Option(label: 'Light Blue', value: Colors.blue[50]),
        Option(label: 'Light Green', value: Colors.green[50]),
        Option(label: 'Light Red', value: Colors.red[50]),
        Option(label: 'Light Yellow', value: Colors.yellow[50]),
      ],
    );
  }

  static EdgeInsets? getPaddingKnob(KnobsBuilder knobs) {
    return knobs.options(
      label: 'Padding',
      initial: null,
      options: [
        const Option(label: 'None', value: null),
        const Option(label: 'Small (4px)', value: EdgeInsets.all(4.0)),
        const Option(label: 'Medium (8px)', value: EdgeInsets.all(8.0)),
        const Option(label: 'Large (16px)', value: EdgeInsets.all(16.0)),
        const Option(
          label: 'Custom (H:16, V:8)',
          value: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ],
    );
  }
}
