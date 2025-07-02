import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../widgets/switch_option_widget.dart';

/// System settings section showing system-level toggles
class SystemSettingsSection extends StatefulWidget {
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchStyle style;
  final SwitchState state;
  final bool showDescription;
  final bool fullWidth;
  final SwitchLabelPosition labelPosition;
  final bool darkBackground;

  const SystemSettingsSection({
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
  State<SystemSettingsSection> createState() => _SystemSettingsSectionState();
}

class _SystemSettingsSectionState extends State<SystemSettingsSection> {
  bool isBluetoothEnabled = true;
  bool isWifiEnabled = false;
  bool isLocationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      title: 'System Settings',
      description: 'Toggle system features on or off',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchOptionWidget(
            value: isBluetoothEnabled,
            label: 'Bluetooth',
            description: 'Connect to nearby devices wirelessly',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isBluetoothEnabled = value),
          ),
          const SizedBox(height: 4),
          SwitchOptionWidget(
            value: isWifiEnabled,
            label: 'Wi-Fi',
            description: 'Connect to internet via wireless networks',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isWifiEnabled = value),
          ),
          const SizedBox(height: 4),
          SwitchOptionWidget(
            value: isLocationEnabled,
            label: 'Location Services',
            description: 'Allow apps to access your location',
            variant: widget.variant,
            size: widget.size,
            style: widget.style,
            state: widget.state,
            showDescription: widget.showDescription,
            fullWidth: widget.fullWidth,
            labelPosition: widget.labelPosition,
            onChanged: (value) => setState(() => isLocationEnabled = value),
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
