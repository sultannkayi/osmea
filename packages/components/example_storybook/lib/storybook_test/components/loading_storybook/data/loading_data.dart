import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔄 **Loading Data Models**
///
/// Data models and mock data for loading showcase.

class LoadingData {
  final LoadingType type;
  final String label;
  final String description;
  final IconData icon;
  final Color color;

  const LoadingData({
    required this.type,
    required this.label,
    required this.description,
    required this.icon,
    required this.color,
  });
}

/// Comprehensive list of all loading types with metadata
const List<LoadingData> allLoadingTypes = [
  LoadingData(
    type: LoadingType.rotatingDots,
    label: 'Rotating Dots',
    description: 'Circular rotating dots animation',
    icon: Icons.radio_button_checked,
    color: Colors.blue,
  ),
  LoadingData(
    type: LoadingType.rotatingArcs,
    label: 'Rotating Arcs',
    description: 'Spinning arc animation',
    icon: Icons.refresh,
    color: Colors.green,
  ),
  LoadingData(
    type: LoadingType.spiral,
    label: 'Spiral',
    description: 'Spiral motion dots',
    icon: Icons.architecture,
    color: Colors.purple,
  ),
  LoadingData(
    type: LoadingType.atom,
    label: 'Atom',
    description: 'Atom-like orbiting dots',
    icon: Icons.science,
    color: Colors.orange,
  ),
  LoadingData(
    type: LoadingType.dualRing,
    label: 'Dual Ring',
    description: 'Two rings spinning together',
    icon: Icons.donut_large,
    color: Colors.teal,
  ),
  LoadingData(
    type: LoadingType.circularFade,
    label: 'Circular Fade',
    description: 'Classic spinner with fading circle',
    icon: Icons.circle_outlined,
    color: Colors.indigo,
  ),
  LoadingData(
    type: LoadingType.fadingCircle,
    label: 'Fading Circle',
    description: 'Circles fading in and out',
    icon: Icons.circle,
    color: Colors.pink,
  ),
  LoadingData(
    type: LoadingType.dotCircle,
    label: 'Dot Circle',
    description: 'Dots arranged in a circle',
    icon: Icons.fiber_manual_record,
    color: Colors.amber,
  ),
  LoadingData(
    type: LoadingType.arcLoader,
    label: 'Arc Loader',
    description: 'Rotating arc animation',
    icon: Icons.autorenew,
    color: Colors.cyan,
  ),
  LoadingData(
    type: LoadingType.chasingDots,
    label: 'Chasing Dots',
    description: 'Dots chasing each other',
    icon: Icons.more_horiz,
    color: Colors.deepOrange,
  ),
  LoadingData(
    type: LoadingType.bouncingDots,
    label: 'Bouncing Dots',
    description: 'Three bouncing dots',
    icon: Icons.more_vert,
    color: Colors.lightGreen,
  ),
  LoadingData(
    type: LoadingType.tripleBounce,
    label: 'Triple Bounce',
    description: 'Three balls bouncing',
    icon: Icons.sports_basketball,
    color: Colors.deepPurple,
  ),
  LoadingData(
    type: LoadingType.zigzagDots,
    label: 'Zigzag Dots',
    description: 'Dots moving in a zigzag pattern',
    icon: Icons.show_chart,
    color: Colors.brown,
  ),
  LoadingData(
    type: LoadingType.barWave,
    label: 'Bar Wave',
    description: 'Bars moving in a wave',
    icon: Icons.equalizer,
    color: Colors.red,
  ),
  LoadingData(
    type: LoadingType.gridPulse,
    label: 'Grid Pulse',
    description: 'Grid of pulsing dots',
    icon: Icons.grid_view,
    color: Colors.blueGrey,
  ),
  LoadingData(
    type: LoadingType.dancingSquares,
    label: 'Dancing Squares',
    description: 'Dancing squares animation',
    icon: Icons.crop_square,
    color: Colors.lime,
  ),
  LoadingData(
    type: LoadingType.dotFlash,
    label: 'Dot Flash',
    description: 'Dots flashing in sequence',
    icon: Icons.flash_on,
    color: Colors.yellow,
  ),
  LoadingData(
    type: LoadingType.barLoader,
    label: 'Bar Loader',
    description: 'Bars with changing heights',
    icon: Icons.bar_chart,
    color: Colors.grey,
  ),
  LoadingData(
    type: LoadingType.waveBars,
    label: 'Wave Bars',
    description: 'Bars moving in a wave pattern',
    icon: Icons.graphic_eq,
    color: Colors.lightBlue,
  ),
  LoadingData(
    type: LoadingType.orbitDot,
    label: 'Orbit Dot',
    description: 'Single dot orbiting',
    icon: Icons.track_changes,
    color: Colors.pinkAccent,
  ),
];

/// Sample size options for loading indicators
const List<double> loadingSizes = [16.0, 24.0, 32.0, 48.0, 64.0, 80.0];

/// Sample color palette for loading indicators
const List<Color> loadingColors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.indigo,
  Colors.cyan,
];

/// Categories for organizing loading types
const Map<String, List<LoadingType>> loadingCategories = {
  'Circular': [
    LoadingType.circularFade,
    LoadingType.fadingCircle,
    LoadingType.dotCircle,
    LoadingType.chasingDots,
    LoadingType.dualRing,
    LoadingType.rotatingDots,
    LoadingType.rotatingArcs,
    LoadingType.arcLoader,
    LoadingType.orbitDot,
    LoadingType.spiral,
    LoadingType.atom,
  ],
  'Linear': [
    LoadingType.bouncingDots,
    LoadingType.tripleBounce,
    LoadingType.zigzagDots,
    LoadingType.barWave,
    LoadingType.barLoader,
    LoadingType.waveBars,
    LoadingType.dotFlash,
    LoadingType.dancingSquares,
  ],
  'Grid': [
    LoadingType.gridPulse,
  ],
};
