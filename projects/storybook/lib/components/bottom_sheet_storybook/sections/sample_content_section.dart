import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📋 **Bottom Sheet Sample Content Section**
///
/// Reusable content sections for different bottom sheet examples
class SampleContentSection extends StatelessWidget {
  final String contentType;
  final double spacing;

  const SampleContentSection({
    super.key,
    required this.contentType,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    switch (contentType) {
      case 'Quick Actions':
        return _buildQuickActionsSection();
      case 'Settings':
        return _buildSettingsSection();
      case 'Form':
        return _buildFormSection();
      case 'Components Showcase':
        return _buildComponentsShowcaseSection();
      case 'Multi-Step Form':
        return _buildMultiStepFormSection();
      default:
        return _buildQuickActionsSection();
    }
  }

  Widget _buildQuickActionsSection() {
    return OsmeaComponents.column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionItem(
          icon: Icons.edit,
          title: 'Edit',
          subtitle: 'Modify content',
        ),
        _buildActionItem(
          icon: Icons.share,
          title: 'Share',
          subtitle: 'Share with others',
        ),
        _buildActionItem(
          icon: Icons.delete,
          title: 'Delete',
          subtitle: 'Remove permanently',
        ),
        _buildActionItem(
          icon: Icons.download,
          title: 'Download',
          subtitle: 'Save to device',
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return OsmeaComponents.column(
      children: [
        _buildSettingItem(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Receive push notifications',
          hasSwitch: true,
          value: true,
        ),
        _buildSettingItem(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          subtitle: 'Use dark theme',
          hasSwitch: true,
          value: false,
        ),
        _buildSettingItem(
          icon: Icons.language,
          title: 'Language',
          subtitle: 'English',
          hasArrow: true,
        ),
        _buildSettingItem(
          icon: Icons.storage,
          title: 'Storage',
          subtitle: 'Manage app storage',
          hasArrow: true,
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.column(
        children: [
          OsmeaComponents.textField(
            label: 'Full Name',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
          ),
          OsmeaComponents.sizedBox(height: spacing),
          OsmeaComponents.textField(
            label: 'Email',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.email,
          ),
          OsmeaComponents.sizedBox(height: spacing),
          OsmeaComponents.textField(
            label: 'Phone',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildComponentsShowcaseSection() {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(20),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Badge examples
          OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OsmeaComponents.badge(
                content: 'Small',
                size: BadgeSize.small,
                variant: BadgeVariant.success,
              ),
              OsmeaComponents.badge(
                content: 'Medium',
                size: BadgeSize.medium,
                variant: BadgeVariant.primary,
              ),
              OsmeaComponents.badge(
                content: 'Large',
                size: BadgeSize.large,
                variant: BadgeVariant.warning,
              ),
            ],
          ),
          OsmeaComponents.sizedBox(height: 24),

          // Button examples
          OsmeaComponents.button(
            text: 'Primary Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          OsmeaComponents.sizedBox(height: 12),
          OsmeaComponents.button(
            text: 'Secondary Button',
            variant: ButtonVariant.secondary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMultiStepFormSection() {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(20),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.textField(
            label: 'First Name',
            hint: 'Enter your first name',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            isRequired: true,
          ),
          OsmeaComponents.sizedBox(height: spacing),
          OsmeaComponents.textField(
            label: 'Last Name',
            hint: 'Enter your last name',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            isRequired: true,
          ),
          OsmeaComponents.sizedBox(height: spacing),
          OsmeaComponents.textField(
            label: 'Email',
            hint: 'Enter your email address',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.email,
            isRequired: true,
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return OsmeaComponents.listItem(
      leading: Icon(icon),
      title: OsmeaComponents.text(title),
      subtitle: OsmeaComponents.text(subtitle),
      onTap: () {},
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool hasSwitch = false,
    bool hasArrow = false,
    bool value = false,
  }) {
    return OsmeaComponents.listItem(
      leading: Icon(icon),
      title: OsmeaComponents.text(title),
      subtitle: OsmeaComponents.text(subtitle),
      trailing: hasSwitch
          ? OsmeaComponents.switchButton(
              value: value,
              onChanged: (newValue) {},
            )
          : hasArrow
              ? const Icon(Icons.arrow_forward_ios)
              : null,
    );
  }
}
