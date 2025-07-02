import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/switch_option_widget.dart';

/// Privacy section showing privacy and data related toggles
class PrivacySection extends StatefulWidget {
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchStyle style;
  final SwitchState state;
  final bool showDescription;
  final bool fullWidth;
  final SwitchLabelPosition labelPosition;
  final bool darkBackground;

  const PrivacySection({
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
  State<PrivacySection> createState() => _PrivacySectionState();
}

class _PrivacySectionState extends State<PrivacySection> {
  bool isAnalyticsEnabled = false;
  bool isCrashReportingEnabled = true;
  bool isDataSharingEnabled = false;

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      title: 'Privacy & Data',
      description: 'Control how your data is used',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchOptionWidget(
            value: isAnalyticsEnabled,
            label: 'Usage Analytics',
            description: 'Help improve the app by sharing usage data',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isAnalyticsEnabled = value),
          ),
          const SizedBox(height: 4),
          SwitchOptionWidget(
            value: isCrashReportingEnabled,
            label: 'Crash Reporting',
            description: 'Automatically send crash reports to developers',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isCrashReportingEnabled = value),
          ),
          const SizedBox(height: 4),
          SwitchOptionWidget(
            value: isDataSharingEnabled,
            label: 'Data Sharing',
            description: 'Share anonymized data with third parties',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isDataSharingEnabled = value),
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
