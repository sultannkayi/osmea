import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

// Import modular components
import '../widgets/section_container_widget.dart';
import '../sections/header_section.dart';
import '../sections/sample_content_section.dart';

/// ☑️ **Unified Checkbox Showcase Widget - Modular Structure**
/// 
/// Main showcase widget that demonstrates all checkbox variations
/// Uses modular components from the template structure

class UnifiedCheckboxShowcaseWidget extends StatefulWidget {
  final CheckboxVariant variant;
  final CheckboxSize size;
  final CheckboxStyle style;
  final CheckboxState state;
  final bool isEnabled;
  final bool tristate;
  final bool showDescription;
  final bool fullWidth;
  final CheckboxLabelPosition labelPosition;
  final bool darkBackground;

  const UnifiedCheckboxShowcaseWidget({
    Key? key,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.isEnabled,
    required this.tristate,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  }) : super(key: key);

  @override
  State<UnifiedCheckboxShowcaseWidget> createState() => _UnifiedCheckboxShowcaseWidgetState();
}

class _UnifiedCheckboxShowcaseWidgetState extends State<UnifiedCheckboxShowcaseWidget> {
  // Simple state management
  bool? agreeToTerms = false;
  bool? enableNotifications = true;
  bool? enableDarkMode = false;
  
  // Features checklist
  bool? featureAnalytics = true;
  bool? featureSync = false;
  bool? featureOffline; // For tristate demo
  
  // Settings preferences
  bool? settingAutoSave = true;
  bool? settingBackup = false;
  bool? settingUpdates = true;

  @override
  void initState() {
    super.initState();
    // Initialize tristate example
    featureOffline = widget.tristate ? null : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.darkBackground ? Colors.grey.shade800 : Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Information
            HeaderSection(
              variant: widget.variant.toString().split('.').last,
              size: widget.size.toString().split('.').last,
              style: widget.style.toString().split('.').last,
              state: widget.state.toString().split('.').last,
              tristate: widget.tristate,
              darkBackground: widget.darkBackground,
            ),
            const SizedBox(height: 24),
            
            // Terms & Agreements (Simple Example)
            SectionContainerWidget(
              title: 'Terms & Agreements',
              description: 'Accept terms and conditions',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCheckboxOption(
                    value: agreeToTerms,
                    label: 'I agree to the Terms of Service',
                    description: 'Required to proceed with registration',
                    onChanged: (value) => setState(() => agreeToTerms = value),
                  ),
                  const SizedBox(height: 4),
                  _buildCheckboxOption(
                    value: enableNotifications,
                    label: 'Send me email notifications',
                    description: 'Get updates about new features and changes',
                    onChanged: (value) => setState(() => enableNotifications = value),
                  ),
                  const SizedBox(height: 4),
                  _buildCheckboxOption(
                    value: enableDarkMode,
                    label: 'Enable dark mode by default',
                    description: 'Automatically use dark theme on app launch',
                    onChanged: (value) => setState(() => enableDarkMode = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // User Preferences (Shows different content per variant)
            SectionContainerWidget(
              title: 'User Preferences',
              description: 'Customize your experience',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCheckboxOption(
                    value: settingAutoSave,
                    label: 'Auto-save documents',
                    description: 'Automatically save changes every 30 seconds',
                    onChanged: (value) => setState(() => settingAutoSave = value),
                  ),
                  const SizedBox(height: 4),
                  _buildCheckboxOption(
                    value: settingBackup,
                    label: 'Cloud backup',
                    description: 'Backup data to cloud storage',
                    onChanged: (value) => setState(() => settingBackup = value),
                  ),
                  const SizedBox(height: 4),
                  _buildCheckboxOption(
                    value: settingUpdates,
                    label: 'Automatic updates',
                    description: 'Install updates automatically when available',
                    onChanged: (value) => setState(() => settingUpdates = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Features Checklist (Shows tristate if enabled)
            SectionContainerWidget(
              title: 'Features Checklist',
              description: widget.tristate 
                ? 'Feature status (✓ enabled, ✗ disabled, ◐ partial)'
                : 'Enable or disable application features',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCheckboxOption(
                    value: featureAnalytics,
                    label: 'Analytics & Reporting',
                    description: 'Track usage patterns and generate reports',
                    onChanged: (value) => setState(() => featureAnalytics = value),
                  ),
                  const SizedBox(height: 4),
                  _buildCheckboxOption(
                    value: featureSync,
                    label: 'Real-time Sync',
                    description: 'Synchronize data across all devices',
                    onChanged: (value) => setState(() => featureSync = value),
                  ),
                  const SizedBox(height: 4),
                  _buildCheckboxOption(
                    value: widget.tristate ? featureOffline : (featureOffline ?? false),
                    label: 'Offline Mode',
                    description: widget.tristate 
                      ? 'Partially configured - some features work offline'
                      : 'Access content without internet connection',
                    onChanged: (value) => setState(() => featureOffline = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Style Comparison Section
            SampleContentSection(
              variant: widget.variant,
              size: widget.size,
              style: widget.style,
              state: widget.state,
              labelPosition: widget.labelPosition,
              tristate: widget.tristate,
              showDescription: widget.showDescription,
              fullWidth: widget.fullWidth,
              darkBackground: widget.darkBackground,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxOption({
    required bool? value,
    required String label,
    required String description,
    required ValueChanged<bool?>? onChanged,
  }) {
    return Container(
      width: widget.fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: OsmeaComponents.checkbox(
          value: value,
          label: label,
          description: widget.showDescription ? description : null,
          variant: widget.variant,
          size: widget.size,
          style: widget.style,
          state: widget.state != CheckboxState.disabled ? widget.state : CheckboxState.disabled,
          fullWidth: widget.fullWidth,
          labelPosition: widget.labelPosition,
          tristate: widget.tristate,
          onChanged: widget.state == CheckboxState.disabled ? null : onChanged,
        ),
      ),
    );
  }
}
