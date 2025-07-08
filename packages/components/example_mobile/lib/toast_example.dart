import 'package:flutter/material.dart';
import 'dart:math';

import 'package:osmea_components/osmea_components.dart';

// Modern Toast Example Page
class ToastExamplePage extends StatefulWidget {
  const ToastExamplePage({super.key});

  @override
  State<ToastExamplePage> createState() => _ToastExamplePageState();
}

class _ToastExamplePageState extends State<ToastExamplePage> {
  bool _stacked = true;

  ToastStyle _selectedStyle = ToastStyle.defaultStyle;
  ToastType _selectedType = ToastType.success;
  ToastPosition _selectedPosition = ToastPosition.bottom;
  ToastAnimation _selectedAnimation = ToastAnimation.slide;
  int _maxToasts = 3;

  static const Map<ToastType, String> _typeLabels = {
    ToastType.success: 'Success',
    ToastType.error: 'Error',
    ToastType.warning: 'Warning',
    ToastType.info: 'Info',
  };

  static const Map<ToastStyle, String> _styleLabels = {
    ToastStyle.defaultStyle: 'Default',
    ToastStyle.modern: 'Modern',
    ToastStyle.minimal: 'Minimal',
    ToastStyle.outline: 'Outline',
  };

  static const Map<ToastPosition, String> _positionLabels = {
    ToastPosition.top: 'Top',
    ToastPosition.center: 'Center',
    ToastPosition.bottom: 'Bottom',
  };

  static const Map<ToastAnimation, String> _animationLabels = {
    ToastAnimation.fade: 'Fade',
    ToastAnimation.slide: 'Slide',
    ToastAnimation.scale: 'Scale',
  };

  static const List<String> _randomTitles = [
    'Information',
    'Warning',
    'Success',
    'Error',
    'Notification',
    'Message',
    'Status',
    'Tip',
    'Attention',
    'Test',
  ];
  static const List<String> _randomMessages = [
    'This is a random toast message.',
    'Another example message.',
    'Testing toast close order.',
    'Is stacking enabled?',
    'Is stacking disabled?',
    'Toast notification example.',
    'A different notification.',
    'Animation test.',
    'Observing close order.',
    'This is a demo message.',
  ];
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsmeaColors.snow,
      appBar: AppBar(
        title: const Text('Toast Demo',
            maxLines: 1, overflow: TextOverflow.ellipsis),
        centerTitle: true,
        backgroundColor: OsmeaColors.white,
        elevation: 0.5,
        foregroundColor: OsmeaColors.black54,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Text('Stacked',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Switch(
                  value: _stacked,
                  onChanged: (val) => setState(() => _stacked = val),
                  activeColor: OsmeaColors.meadow,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.notifications_active,
                              color: OsmeaColors.nordicBlue, size: 26),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Toast Showcase',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try different toast styles, types, positions, and animations below.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: OsmeaColors.black54),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 24),
                      _buildSectionHeader('Toast Style'),
                      _buildDropdown<ToastStyle>(
                        value: _selectedStyle,
                        items: ToastStyle.values,
                        labels: _styleLabels,
                        onChanged: (val) =>
                            setState(() => _selectedStyle = val!),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionHeader('Toast Type'),
                      _buildDropdown<ToastType>(
                        value: _selectedType,
                        items: ToastType.values,
                        labels: _typeLabels,
                        onChanged: (val) =>
                            setState(() => _selectedType = val!),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionHeader('Toast Position'),
                      _buildDropdown<ToastPosition>(
                        value: _selectedPosition,
                        items: ToastPosition.values,
                        labels: _positionLabels,
                        onChanged: (val) =>
                            setState(() => _selectedPosition = val!),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionHeader('Toast Animation'),
                      _buildDropdown<ToastAnimation>(
                        value: _selectedAnimation,
                        items: ToastAnimation.values,
                        labels: _animationLabels,
                        onChanged: (val) =>
                            setState(() => _selectedAnimation = val!),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionHeader('Max Toasts'),
                      Slider(
                        value: _maxToasts.toDouble(),
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: _maxToasts.toString(),
                        onChanged: (val) =>
                            setState(() => _maxToasts = val.round()),
                        activeColor: OsmeaColors.nordicBlue,
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: OsmeaColors.nordicBlue,
                            foregroundColor: OsmeaColors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 4,
                          ),
                          icon: Icon(_stacked ? Icons.layers : Icons.filter_1,
                              size: 20),
                          label: Text(
                            _stacked
                                ? 'Show Toast (Stacked)'
                                : 'Show Toast (Single)',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          onPressed: () => _showToast(context),
                        ),
                      ),
                      const SizedBox(
                          height:
                              32), // Extra space to avoid overlap with toast/snackbar
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: OsmeaColors.black54,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T value,
    required List<T> items,
    required Map<T, String> labels,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButton<T>(
      value: value,
      isExpanded: true,
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(labels[item] ?? item.toString()),
              ))
          .toList(),
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(12),
      underline: Container(height: 2, color: OsmeaColors.nordicBlue.withOpacity(0.1)),
      style: TextStyle(fontSize: 15, color: OsmeaColors.steel),
      dropdownColor: OsmeaColors.white,
      elevation: 2,
    );
  }

  void _showToast(BuildContext context) {
    final title = _randomTitles[_random.nextInt(_randomTitles.length)];
    final message = _randomMessages[_random.nextInt(_randomMessages.length)];
    OsmeaComponents.toast(
      context: context,
      title: title,
      message: message,
      type: _selectedType,
      style: _selectedStyle,
      position: _selectedPosition,
      animation: _selectedAnimation,
      maxToasts: _maxToasts,
      stacked: _stacked,
      duration: const Duration(seconds: 3),
    );
  }
}
