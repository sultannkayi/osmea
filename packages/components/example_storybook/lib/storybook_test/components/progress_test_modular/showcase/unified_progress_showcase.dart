import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/knobs_config.dart';
import 'progress_showcase_widget.dart';

/// 📊 **Unified Progress Showcase - Modular Structure**
///
/// Single story providing interactive controls for the Progress component.
List<Story> getUnifiedProgressShowcase() {
  return [
    Story(
      name: 'Progress',
      builder: (context) {
        final circularType = context.knobs.options(
          label: 'Circular Type',
          initial: ProgressType.wave,
          options: ProgressKnobsConfig.circularTypeOptions,
        );
        final linearType = context.knobs.options(
          label: 'Linear Type',
          initial: ProgressType.linear,
          options: ProgressKnobsConfig.linearTypeOptions,
        );
        final progressSize = context.knobs.options(
          label: 'Size',
          initial: ProgressSize.medium,
          options: ProgressKnobsConfig.sizeOptions,
        );
        final progressColor = context.knobs.options(
          label: 'Color',
          initial: 'nordicBlue',
          options: ProgressKnobsConfig.getColorOptions(),
        );
        final progressValue = context.knobs.slider(
          label: 'Progress Value',
          initial: 0.6,
          min: 0.0,
          max: 1.0,
        );
        final showPercentage = context.knobs.boolean(
          label: 'Show Progress Value',
          initial: true,
        );
        return ProgressShowcaseWidget(
          circularType: circularType,
          linearType: linearType,
          progressSize: progressSize,
          progressColor: progressColor,
          progressValue: progressValue,
          showPercentage: showPercentage,
        );
      },
    ),
  ];
}
