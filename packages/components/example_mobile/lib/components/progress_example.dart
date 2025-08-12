import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/common_appbar.dart';

class ProgressExample extends StatefulWidget {
  const ProgressExample({Key? key}) : super(key: key);

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  // Auto progress control
  bool isAutoProgressEnabled = true;
  double autoProgressSpeed = 0.05;
  bool isIncreasing = true;

  final progressTypes = [
    ProgressType.wave,
    ProgressType.radialBar,
    ProgressType.arc,
    ProgressType.percent,
    ProgressType.dotCircleBar,
  ];

  final progressLabels = [
    'Wave',
    'Radial Bar',
    'Arc',
    'Segment'
        'Percent',
    'Dot Circle Bar',
  ];

  final progressColors = [
    OsmeaColors.azureWave,
    OsmeaColors.nordicBlue,
    OsmeaColors.purple,
    OsmeaColors.blue,
    OsmeaColors.meadow,
    OsmeaColors.sunsetGlow,
  ];

  final progressSizes = [
    ProgressSize.extraSmall,
    ProgressSize.small,
    ProgressSize.medium,
    ProgressSize.large,
    ProgressSize.extraLarge,
  ];

  final progressSizeLabels = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
  ];

  final linearTypes = [
    ProgressType.linear,
    ProgressType.linearGradient,
    ProgressType.linearSegmented,
    ProgressType.linearRounded,
    ProgressType.linearBuffer,
  ];

  final linearLabels = [
    'Linear',
    'Gradient',
    'Segmented',
    'Rounded',
    'Buffer',
  ];

  final linearColors = [
    OsmeaColors.nordicBlue,
    OsmeaColors.nordicBlue,
    OsmeaColors.meadow,
    OsmeaColors.purple,
    OsmeaColors.nordicBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: const OsmeaComponentsAppBar(
        screenKey: 'progress_example',
      ),
      body: OsmeaComponents.padding(
        padding: const EdgeInsets.all(16.0),
        child: OsmeaComponents.singleChildScrollView(
          child: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Simple controls
              Card(
                child: OsmeaComponents.padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OsmeaComponents.column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OsmeaComponents.text(
                        '🔄 Auto Progress Controls',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),

                      // Direction buttons
                      OsmeaComponents.row(
                        children: [
                          Expanded(
                            child: OsmeaComponents.button(
                              text: 'Increase',
                              onPressed: isIncreasing
                                  ? null
                                  : () => setState(() => isIncreasing = true),
                              variant: isIncreasing
                                  ? ButtonVariant.primary
                                  : ButtonVariant.outlined,
                              size: ButtonSize.small,
                              icon: const Icon(Icons.trending_up, size: 16),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OsmeaComponents.button(
                              text: 'Decrease',
                              onPressed: !isIncreasing
                                  ? null
                                  : () => setState(() => isIncreasing = false),
                              variant: !isIncreasing
                                  ? ButtonVariant.primary
                                  : ButtonVariant.outlined,
                              size: ButtonSize.small,
                              icon: const Icon(Icons.trending_down, size: 16),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Speed control
                      OsmeaComponents.text(
                        'Speed: ${(autoProgressSpeed * 1000).toStringAsFixed(0)} ms',
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      Slider(
                        value: autoProgressSpeed,
                        min: 0.02,
                        max: 0.15,
                        divisions: 13,
                        label:
                            '${(autoProgressSpeed * 1000).toStringAsFixed(0)} ms',
                        onChanged: (value) =>
                            setState(() => autoProgressSpeed = value),
                      ),
                    ],
                  ),
                ),
              ),
              OsmeaComponents.sizedBox(height: 16),

              // Circular progress types
              ...List.generate(
                progressTypes.length,
                (i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OsmeaComponents.text(
                      progressLabels[i],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    Column(
                      children: List.generate(
                        (progressSizes.length / 2).ceil(),
                        (rowIdx) {
                          final firstIdx = rowIdx * 2;
                          final secondIdx = firstIdx + 1;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      OsmeaComponents.progress(
                                        key:
                                            ValueKey('circular_${i}_$firstIdx'),
                                        type: progressTypes[i],
                                        value: isIncreasing ? 0.0 : 1.0,
                                        size: progressSizes[firstIdx],
                                        progressColor: progressColors[i],
                                        showPercentage: true,
                                        isAutoProgressEnabled:
                                            isAutoProgressEnabled,
                                        autoProgressSpeed: autoProgressSpeed,
                                        isIncreasing: isIncreasing,
                                      ),
                                      const SizedBox(height: 8),
                                      OsmeaComponents.text(
                                        progressSizeLabels[firstIdx],
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (secondIdx < progressSizes.length)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        OsmeaComponents.progress(
                                          key: ValueKey(
                                              'circular_${i}_$secondIdx'),
                                          type: progressTypes[i],
                                          value: isIncreasing ? 0.0 : 1.0,
                                          size: progressSizes[secondIdx],
                                          progressColor: progressColors[i],
                                          showPercentage: true,
                                          isAutoProgressEnabled:
                                              isAutoProgressEnabled,
                                          autoProgressSpeed: autoProgressSpeed,
                                          isIncreasing: isIncreasing,
                                        ),
                                        OsmeaComponents.sizedBox(height: 8),
                                        OsmeaComponents.text(
                                          progressSizeLabels[secondIdx],
                                          fontSize: 13,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                const Expanded(child: SizedBox()),
                            ],
                          );
                        },
                      ),
                    ),
                    OsmeaComponents.sizedBox(height: 32),
                  ],
                ),
              ),

              // Linear progress bars section
              OsmeaComponents.divider(height: 48, thickness: 2),
              OsmeaComponents.text(
                'Linear Progress Bars',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              OsmeaComponents.sizedBox(height: 16),

              ...List.generate(
                linearTypes.length,
                (i) => OsmeaComponents.column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OsmeaComponents.text(
                      linearLabels[i],
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    // Progress bars row
                    OsmeaComponents.padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OsmeaComponents.wrap(
                        spacing: 16,
                        runSpacing: 24,
                        children: List.generate(
                          progressSizes.length,
                          (j) => OsmeaComponents.sizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: OsmeaComponents.column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OsmeaComponents.progress(
                                  key: ValueKey('linear_${i}_$j'),
                                  type: linearTypes[i],
                                  value: isIncreasing ? 0.0 : 1.0,
                                  size: progressSizes[j],
                                  progressColor: linearColors[i],
                                  showPercentage: true,
                                  speed: 1.0,
                                  isAutoProgressEnabled: isAutoProgressEnabled,
                                  autoProgressSpeed: autoProgressSpeed,
                                  isIncreasing: isIncreasing,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    OsmeaComponents.sizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
