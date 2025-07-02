import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class LoadingExample extends StatelessWidget {
  const LoadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> loadingTypes = [
      {
        'type': LoadingType.rotatingDots,
        'label': 'Rotating Dots',
        'desc': 'Circular rotating dots animation.'
      },
      {
        'type': LoadingType.rotatingArcs,
        'label': 'Rotating Arcs',
        'desc': 'Spinning arc animation.'
      },
      {
        'type': LoadingType.spiral,
        'label': 'Spiral',
        'desc': 'Spiral motion dots.'
      },
      {
        'type': LoadingType.atom,
        'label': 'Atom',
        'desc': 'Atom-like orbiting dots.'
      },
      {
        'type': LoadingType.dualRing,
        'label': 'Dual Ring',
        'desc': 'Two rings spinning together.'
      },
      {
        'type': LoadingType.circularFade,
        'label': 'Circular Fade',
        'desc': 'Classic spinner with fading circle.'
      },
      {
        'type': LoadingType.fadingCircle,
        'label': 'Fading Circle',
        'desc': 'Circles fading in and out.'
      },
      {
        'type': LoadingType.dotCircle,
        'label': 'Dot Circle',
        'desc': 'Dots arranged in a circle.'
      },
      {
        'type': LoadingType.arcLoader,
        'label': 'Arc Loader',
        'desc': 'Rotating arc animation.'
      },
      {
        'type': LoadingType.chasingDots,
        'label': 'Chasing Dots',
        'desc': 'Dots chasing each other.'
      },
      {
        'type': LoadingType.bouncingDots,
        'label': 'Bouncing Dots',
        'desc': 'Three bouncing dots.'
      },
      {
        'type': LoadingType.tripleBounce,
        'label': 'Triple Bounce',
        'desc': 'Three balls bouncing.'
      },
      {
        'type': LoadingType.zigzagDots,
        'label': 'Zigzag Dots',
        'desc': 'Dots moving in a zigzag pattern.'
      },
      {
        'type': LoadingType.barWave,
        'label': 'Bar Wave',
        'desc': 'Bars moving in a wave.'
      },
      {
        'type': LoadingType.gridPulse,
        'label': 'Grid Pulse',
        'desc': 'Grid of pulsing dots.'
      },
      {
        'type': LoadingType.dancingSquares,
        'label': 'Dancing Squares',
        'desc': 'Dancing squares animation.'
      },
      {
        'type': LoadingType.dotFlash,
        'label': 'Dot Flash',
        'desc': 'Dots flashing in sequence.'
      },
      {
        'type': LoadingType.barLoader,
        'label': 'Bar Loader',
        'desc': 'Bars with changing heights.'
      },
      {
        'type': LoadingType.waveBars,
        'label': 'Wave Bars',
        'desc': 'Bars moving in a wave pattern.'
      },
      {
        'type': LoadingType.orbitDot,
        'label': 'Orbit Dot',
        'desc': 'Single dot orbiting.'
      },
    ];
    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.amber,
      Colors.indigo,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.lime,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.yellow,
      Colors.lightGreen,
      Colors.indigoAccent,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.tealAccent,
      Colors.pinkAccent,
      Colors.black,
      Colors.white,
      Colors.brown.shade300,
      Colors.blue.shade900,
    ];

    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('OSMEA Loading Animations'),
        centerTitle: true,
      ),
      body: OsmeaComponents.padding(
        padding: const EdgeInsets.all(20),
        child: OsmeaComponents.singleChildScrollView(
          child: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.text(
                'Modern OSMEA Loading Animations',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              OsmeaComponents.sizedBox(height: 16),
              OsmeaComponents.text(
                'Below you can see all loading animations in the OSMEA library, presented in different sizes and colors. Each animation is shown with a short description and multiple sizes for a modern, clear showcase.',
                fontSize: 16,
                color: Colors.grey[700],
              ),
              OsmeaComponents.sizedBox(height: 24),
              for (int i = 0; i < loadingTypes.length; i++)
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: OsmeaComponents.padding(
                    padding: const EdgeInsets.all(20),
                    child: OsmeaComponents.column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OsmeaComponents.row(
                          children: [
                            Icon(Icons.bubble_chart,
                                color: colors[i % colors.length], size: 28),
                            OsmeaComponents.sizedBox(width: 12),
                            OsmeaComponents.text(
                              loadingTypes[i]['label'],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        OsmeaComponents.sizedBox(height: 8),
                        OsmeaComponents.text(
                          loadingTypes[i]['desc'],
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                        OsmeaComponents.sizedBox(height: 16),
                        OsmeaComponents.column(
                          children: [
                            OsmeaComponents.row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (final size in [24.0, 36.0])
                                  OsmeaComponents.padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    child: ClipRect(
                                      child: Container(
                                        width: size + 32,
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: colors[i % colors.length]
                                              .withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: OsmeaComponents.column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: OsmeaComponents.loading(
                                                type: loadingTypes[i]['type'],
                                                size: size,
                                                color: colors[i % colors.length],
                                              ),
                                            ),
                                            OsmeaComponents.sizedBox(height: 8),
                                            OsmeaComponents.text(
                                              '${size.toInt()} px',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            OsmeaComponents.sizedBox(height: 12),
                            OsmeaComponents.row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (final size in [48.0, 64.0])
                                  OsmeaComponents.padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    child: ClipRect(
                                      child: Container(
                                        width: size + 32,
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: colors[i % colors.length]
                                              .withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: OsmeaComponents.column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: OsmeaComponents.loading(
                                                type: loadingTypes[i]['type'],
                                                size: size,
                                                color: colors[i % colors.length],
                                              ),
                                            ),
                                            OsmeaComponents.sizedBox(height: 8),
                                            OsmeaComponents.text(
                                              '${size.toInt()} px',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
