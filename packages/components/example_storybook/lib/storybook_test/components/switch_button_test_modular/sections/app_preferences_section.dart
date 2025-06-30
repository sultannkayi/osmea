import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/switch_option_widget.dart';

/// App preferences section showing user preference toggles
class AppPreferencesSection extends StatefulWidget {
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchStyle style;
  final SwitchState state;
  final bool showDescription;
  final bool fullWidth;
  final SwitchLabelPosition labelPosition;
  final bool darkBackground;

  const AppPreferencesSection({
    Key? key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  }) : super(key: key);

  @override
  State<AppPreferencesSection> createState() => _AppPreferencesSectionState();
}

class _AppPreferencesSectionState extends State<AppPreferencesSection> {
  bool isDarkModeEnabled = false;
  bool isAutoSaveEnabled = true;
  bool isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      title: 'App Preferences',
      description: 'Customize your app experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchOptionWidget(
            value: isDarkModeEnabled,
            label: 'Dark Mode',
            description: 'Use dark theme for better viewing in low light',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isDarkModeEnabled = value),
          ),
          const SizedBox(height: 4),
          SwitchOptionWidget(
            value: isAutoSaveEnabled,
            label: 'Auto Save',
            description: 'Automatically save your work every few minutes',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isAutoSaveEnabled = value),
          ),
          const SizedBox(height: 4),
          SwitchOptionWidget(
            value: isNotificationsEnabled,
            label: 'Push Notifications',
            description: 'Receive notifications about updates and messages',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isNotificationsEnabled = value),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.darkBackground ? Colors.grey.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: widget.darkBackground ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: widget.darkBackground ? Colors.grey.shade300 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
