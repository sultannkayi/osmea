import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ProgressExample extends StatefulWidget {
  const ProgressExample({Key? key}) : super(key: key);

  @override
  State<ProgressExample> createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  // Single slider for all progress types
  double progressValue = 0.25;
  bool showPercentageInBar = true;

  final progressTypes = [
    ProgressType.wave,
    ProgressType.radialBar,
    ProgressType.arc,
    ProgressType.percent,
    ProgressType.segmented,
    ProgressType.dotCircleBar,
  ];

  final progressLabels = [
    'Wave',
    'Radial Bar',
    'Arc',
    'Percent',
    'Segment',
    'Dot Circle Bar',
  ];

  final progressColors = [
    Colors.cyan,
    Colors.lightBlueAccent,
    Colors.deepPurpleAccent,
    Colors.blue,
    Colors.tealAccent,
    Colors.orangeAccent,
  ];

  final progressSizes = [
    ProgressSize.extraSmall,
    ProgressSize.small,
    ProgressSize.medium,
    ProgressSize.large,
    ProgressSize.extraLarge,
  ];

  // Short labels for sizes
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
    Colors.blueAccent,
    Colors.indigoAccent,
    Colors.tealAccent,
    Colors.purple,
    Colors.blueAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Examples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Toggle for showing percentage inside bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Show percentage inside bar',
                      style: TextStyle(fontSize: 16)),
                  Switch(
                    value: showPercentageInBar,
                    onChanged: (v) => setState(() => showPercentageInBar = v),
                  ),
                ],
              ),
              // Progress control slider
              Slider(
                value: progressValue,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                label: '${(progressValue * 100).toStringAsFixed(0)}%',
                onChanged: (v) => setState(() => progressValue = v),
              ),

              // Circular progress types
              ...List.generate(
                progressTypes.length,
                (i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      progressLabels[i],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: progressSizes.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 24),
                        itemBuilder: (context, j) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              OsmeaComponents.progress(
                                type: progressTypes[i],
                                value: progressValue,
                                size: progressSizes[j],
                                color: progressColors[i],
                                showPercentage: true,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                progressSizeLabels[j],
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),

              // Linear progress bars section
              const Divider(height: 48, thickness: 2),
              const Text(
                'Linear Progress Bars',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 16),

              ...List.generate(
                linearTypes.length,
                (i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      linearLabels[i],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                    // Progress bars row
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 24,
                        children: List.generate(
                          progressSizes.length,
                          (j) => SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OsmeaComponents.progress(
                                  type: linearTypes[i],
                                  value: progressValue,
                                  size: progressSizes[j],
                                  color: linearColors[i],
                                  showPercentage: showPercentageInBar,
                                  speed: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
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
