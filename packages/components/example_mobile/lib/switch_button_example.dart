import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔄 **OSMEA Switch Button Examples**
///
/// Comprehensive examples demonstrating all variants, sizes, and features
/// of the OSMEA Switch component library.
///
/// This file showcases:
/// * 🎨 All switch variants (simple, labeled, toggle, slider, card, compact, extended)
/// * 📏 All size options (small, medium, large)
/// * 🎭 All visual styles (material, modern, glassmorphism, etc.)
/// * 🔄 All interactive states (enabled, disabled, focused, hovered)
/// * 🏷️ Label and description examples
/// * 🎨 Custom color examples using activeColor parameter
/// * ⚙️ Custom styling options

class SwitchButtonExample extends StatefulWidget {
  const SwitchButtonExample({super.key});

  @override
  State<SwitchButtonExample> createState() => _SwitchButtonExampleState();
}

class _SwitchButtonExampleState extends State<SwitchButtonExample> {
  // State variables for different switch variants
  bool _simpleSwitch = true;
  bool _labeledSwitch = false;
  bool _toggleSwitch = true;
  bool _sliderSwitch = false;
  bool _cardSwitch = true;
  bool _compactSwitch = false;
  bool _extendedSwitch = true;

  // State variables for different sizes
  bool _smallSwitch = true;
  bool _mediumSwitch = false;
  bool _largeSwitch = true;

  // State variables for different styles
  bool _materialStyle = true;
  bool _cupertinoStyle = false;
  bool _modernStyle = true;
  bool _glassmorphismStyle = true;
  bool _minimalStyle = false;

  // State variables for settings example
  bool _darkModeSwitch = false;
  bool _notificationSwitch = true;
  bool _locationSwitch = false;
  bool _bluetoothSwitch = true;
  bool _wifiSwitch = true;
  bool _autoBackupSwitch = false;

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text(
          '🔄 OSMEA Switch Examples',
          variant: OsmeaTextVariant.headlineMedium,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('🎨 Switch Variants'),
            _buildVariantsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('📏 Switch Sizes'),
            _buildSizesSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('⚙️ Settings Example'),
            _buildSettingsSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🔄 State Examples'),
            _buildStateSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🎭 Custom Styled Switches'),
            _buildCustomSection(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('🎭 Switch Styles'),
            _buildStylesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OsmeaComponents.text(
        title,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildVariantsSection() {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            _buildSwitchRow(
              '🎯 Simple Switch',
              'Basic switch without labels',
              _simpleSwitch,
              (value) => setState(() => _simpleSwitch = value),
              variant: SwitchVariant.simple,
            ),
            const Divider(),
            _buildSwitchRow(
              '🏷️ Labeled Switch',
              'Switch with label support',
              _labeledSwitch,
              (value) => setState(() => _labeledSwitch = value),
              variant: SwitchVariant.labeled,
            ),
            const Divider(),
            _buildSwitchRow(
              '🔄 Toggle Switch',
              'Classic toggle switch style',
              _toggleSwitch,
              (value) => setState(() => _toggleSwitch = value),
              variant: SwitchVariant.toggle,
            ),
            const Divider(),
            _buildSwitchRow(
              '🎚️ Slider Switch',
              'Slider-style switch with smooth animation',
              _sliderSwitch,
              (value) => setState(() => _sliderSwitch = value),
              variant: SwitchVariant.slider,
            ),
            const Divider(),
            _buildSwitchRow(
              '🎴 Card Switch',
              'Switch embedded in card container',
              _cardSwitch,
              (value) => setState(() => _cardSwitch = value),
              variant: SwitchVariant.card,
            ),
            const Divider(),
            _buildSwitchRow(
              '📦 Compact Switch',
              'Minimal space switch for dense layouts',
              _compactSwitch,
              (value) => setState(() => _compactSwitch = value),
              variant: SwitchVariant.compact,
            ),
            const Divider(),
            _buildSwitchRow(
              '🔧 Extended Switch',
              'Full-featured switch with maximum customization',
              _extendedSwitch,
              (value) => setState(() => _extendedSwitch = value),
              variant: SwitchVariant.extended,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizesSection() {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            _buildSwitchRow(
              '🔸 Small Switch',
              'Compact switch for tight spaces (32px)',
              _smallSwitch,
              (value) => setState(() => _smallSwitch = value),
              size: SwitchSize.small,
            ),
            const Divider(),
            _buildSwitchRow(
              '🔶 Medium Switch',
              'Standard switch size (48px)',
              _mediumSwitch,
              (value) => setState(() => _mediumSwitch = value),
              size: SwitchSize.medium,
            ),
            const Divider(),
            _buildSwitchRow(
              '🔷 Large Switch',
              'Prominent switch for accessibility (64px)',
              _largeSwitch,
              (value) => setState(() => _largeSwitch = value),
              size: SwitchSize.large,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            _buildSwitchRow(
              '🌙 Dark Mode',
              'Enable dark theme throughout the app',
              _darkModeSwitch,
              (value) => setState(() => _darkModeSwitch = value),
              variant: SwitchVariant.labeled,
            ),
            const Divider(),
            _buildSwitchRow(
              '🔔 Notifications',
              'Receive push notifications',
              _notificationSwitch,
              (value) => setState(() => _notificationSwitch = value),
              variant: SwitchVariant.labeled,
              customActiveColor: Colors.green,
            ),
            const Divider(),
            _buildSwitchRow(
              '📍 Location Services',
              'Allow location access for better experience',
              _locationSwitch,
              (value) => setState(() => _locationSwitch = value),
              variant: SwitchVariant.labeled,
              customActiveColor: Colors.orange,
            ),
            const Divider(),
            _buildSwitchRow(
              '📶 Bluetooth',
              'Enable Bluetooth connectivity',
              _bluetoothSwitch,
              (value) => setState(() => _bluetoothSwitch = value),
              variant: SwitchVariant.toggle,
              customActiveColor: Colors.blue,
            ),
            const Divider(),
            _buildSwitchRow(
              '📶 WiFi',
              'Connect to available WiFi networks',
              _wifiSwitch,
              (value) => setState(() => _wifiSwitch = value),
              variant: SwitchVariant.slider,
            ),
            const Divider(),
            _buildSwitchRow(
              '💾 Auto Backup',
              'Automatically backup your data',
              _autoBackupSwitch,
              (value) => setState(() => _autoBackupSwitch = value),
              variant: SwitchVariant.card,
              customActiveColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateSection() {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            _buildSwitchRow(
              '✅ Enabled Switch',
              'Normal interactive state',
              true,
              (value) {},
              state: SwitchState.enabled,
            ),
            const Divider(),
            _buildSwitchRow(
              '⚫ Disabled Switch',
              'Non-interactive state',
              false,
              null,
              state: SwitchState.disabled,
            ),
            const Divider(),
            _buildSwitchRow(
              '🎯 Focused Switch',
              'Keyboard focus state',
              true,
              (value) {},
              state: SwitchState.focused,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomSection() {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            // Custom colored switch
            OsmeaComponents.switchButton(
              value: true,
              onChanged: (value) {},
              label: '🎨 Custom Colors',
              description: 'Switch with custom active and inactive colors',
              variant: SwitchVariant.extended,
              size: SwitchSize.large,
              activeColor: Colors.purple,
              inactiveColor: Colors.grey[300],
              thumbColor: Colors.white,
            ),
            const Divider(), // Full width switch
            OsmeaComponents.switchButton(
              value: false,
              onChanged: (value) {},
              label: '📐 Full Width Switch',
              description: 'Switch that takes full available width',
              variant: SwitchVariant.card,
              activeColor: Colors.green, // Custom green color
              fullWidth: true,
            ),
            const Divider(),

            // Switch with custom padding
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.switchButton(
                value: true,
                onChanged: (value) {},
                label: '🎁 Custom Container',
                description: 'Switch inside a custom container',
                variant: SwitchVariant.labeled,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStylesSection() {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            _buildSwitchRow(
              '✨ Modern Style',
              'Contemporary flat design with subtle shadows',
              _modernStyle,
              (value) => setState(() => _modernStyle = value),
              style: SwitchStyle.modern,
            ),
            const Divider(),
            _buildSwitchRow(
              '📱 Material Style',
              'Google Material Design 3 style',
              _materialStyle,
              (value) => setState(() => _materialStyle = value),
              style: SwitchStyle.material,
            ),
            const Divider(),
            _buildSwitchRow(
              '🍎 Cupertino Style',
              'Apple iOS style with smooth animations',
              _cupertinoStyle,
              (value) => setState(() => _cupertinoStyle = value),
              style: SwitchStyle.cupertino,
            ),
            const Divider(),
            _buildSwitchRow(
              '💎 Glassmorphism Style',
              'Glass-like transparency with blur effects',
              _glassmorphismStyle,
              (value) => setState(() => _glassmorphismStyle = value),
              style: SwitchStyle.glassmorphism,
            ),
            const Divider(),
            _buildSwitchRow(
              '🔲 Minimal Style',
              'Ultra-clean design with pure geometric shapes',
              _minimalStyle,
              (value) => setState(() => _minimalStyle = value),
              style: SwitchStyle.minimal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchRow(
    String title,
    String description,
    bool value,
    ValueChanged<bool>? onChanged, {
    SwitchVariant variant = SwitchVariant.labeled,
    SwitchSize size = SwitchSize.medium,
    SwitchState state = SwitchState.enabled,
    SwitchStyle style = SwitchStyle.modern,
    Color? customActiveColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OsmeaComponents.switchButton(
        value: value,
        onChanged: onChanged,
        label: title,
        description: description,
        variant: variant,
        size: size,
        state: state,
        style: style,
        activeColor: customActiveColor,
        fullWidth: true,
      ),
    );
  }
}
